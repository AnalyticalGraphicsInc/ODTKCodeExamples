"""
Functions for generating full runs of ODTK MC using base scenario. Nominal runs can be
executed using this toolbox, or runs using any edited properties from other toolboxes.
"""

import logging
import platform
import sys
import threading
import time
from enum import Enum
from pathlib import Path, PureWindowsPath, PurePosixPath
from typing import List, Union, Tuple

import pandas as pd
from odtk import AttrProxy  # type: ignore

import odtk_monte_toolbox.Data_Manage_Tbx as dmtbx
import odtk_monte_toolbox.Logging_Tbx as logtbx
import odtk_monte_toolbox.Simulator_Tbx as simtbx
from odtk_utilities.odtk_instance import OdtkInstance, OdtkType


class RunType(Enum):
    """
    Enum to specify either single truth or multiple truth mode
    """

    SINGLE_TRUTH = 1
    """
    Runs in single truth mode
    """
    MULTI_TRUTH = 2
    """
    Runs in multiple truth mode
    """

    def __str__(self) -> str:
        return self.name


def openODTKScenario(
    scenario_path: str,
    address: str = "127.0.0.1",
    port: int = 9393,
    application_type: OdtkType = OdtkType.Desktop,
    be_quiet: bool = True,
) -> List[OdtkInstance]:
    """Opens specific ODTK scenario

    Args:
        scenPath (str): _description_

    Returns:
        OdtkInstance: a list of handles on the odtk http api
    """

    odtk_instance = OdtkInstance(
        host=address,
        port=port,
        application_type=application_type,
        be_quiet=be_quiet,
    )
    odtk = odtk_instance.odtk
    odtk_child_count = odtk.children.count
    if odtk_child_count > 0:
        odtk.application.deleteObject("", odtk.scenario[0])

    if platform.system() == "Windows":
        odtk.LoadObject("", str(PureWindowsPath(scenario_path)))
    elif platform.system() == "Linux":
        odtk.LoadObject("", str(PurePosixPath(scenario_path)))

    return odtk_instance


def satelliteTemplateSelection(
    scen: AttrProxy,
    templateName: str,
    logFile: logging.Logger,
    loglist: list,
    initialState: list,
    initialUncertainty: list,
) -> AttrProxy:
    """copies template and adds a new initial state if specified

    Args:
        scen (AttrProxy): scenario handle
        templateName (str): name of the template
        logFile (typing.TextIO): handle for the log file
        initialState (list): the specified initial state
        initialUncertainty (list): initial state uncertainties

        The initial sate should be formatted as such:
        [date [UTCG],
          sma [km],
          ecc [],
          trueargoflat [deg],
          inc [deg],
          raan [deg],
          argofper [deg]]

    Returns:
        str: handle on the satellite object
    """
    satToCopy = scen.Satellite[templateName]
    odtk = scen.Parent
    satName = "MC_" + templateName

    if scen.Children["Satellite"].ItemExists(satName):
        odtk.deleteobject(scen.Satellite[satName])

    odtk.CopyObject(satToCopy)
    odtk.PasteObject(satToCopy)
    satellite = scen.Satellite[f"Copy_of_{templateName}"]
    satellite.MeasurementProcessing.TrackingID = 1234
    satellite.Name = satName
    satellite = scen.Satellite[satName]

    logtbx.log(logFile, f"Satellite {satName} created", loglist)

    keplerian = satellite.OrbitState.ToKeplerian()
    keplerian.CoordFrame = "ICRF"
    keplerian.Epoch.Set(initialState[0], "UTCG")
    keplerian.SemiMajorAxis.Set(initialState[1], "km")
    keplerian.Eccentricity.Value = initialState[2]
    keplerian.TrueArgofLatitude.Set(initialState[3], "deg")
    keplerian.Inclination.Set(initialState[4], "deg")
    keplerian.RAAN.Set(initialState[5], "deg")
    keplerian.ArgofPerigee.Set(initialState[6], "deg")
    satellite.OrbitState.Assign(keplerian)

    stateUnc = satellite.OrbitUncertainty
    stateUnc.R_sigma.Set(initialUncertainty[0], "m")
    stateUnc.I_sigma.Set(initialUncertainty[1], "m")
    stateUnc.C_sigma.Set(initialUncertainty[2], "m")
    stateUnc.Rdot_sigma.Set(initialUncertainty[3], "m/sec")
    stateUnc.Idot_sigma.Set(initialUncertainty[4], "m/sec")
    stateUnc.Cdot_sigma.Set(initialUncertainty[5], "m/sec")

    # Set solar pressure and drag models to specify by coefficient value
    satellite.ForceModel.SolarPressure.Model.SpecMethod = "CrA/M"
    satellite.ForceModel.Drag.Model.SpecMethod = "Ballistic Coeff"
    scen.DefaultTimes.Processes.StartMode = "StartTime"
    scen.DefaultTimes.Processes.StartTime = satellite.OrbitState.Epoch
    return satellite


def runSimulator(
    runName: str,
    simulator: AttrProxy,
    runType: RunType,
    timeSpan: float,
    logFile: logging.Logger,
    loglist: list,
    satNames: Union[list, str],
    outputPath: str,
    trialNum: int = 0,
):
    """Run the simulator

    Args:
        runName (str): unique name for the run
        simulator (AttrProxy): handle on the simulator object
        runType (RunType): type of run i.e. single or multi truth
        timeSpan (float): number of minutes to run the simulator
        logFile (typing.TextIO): handle of the logger
        loglist (list): a running list for displayed log messages
        satNames (list or str): name of the satellite(s)
        outputPath (str): the path of the directory the analysis is being saved
        trialNum (int, optional): if multi truth the trial within the run.
        Defaults to 0.
    """
    da = simulator.Output.DataArchive
    da.FileUpdateMethod = "Overwrite"
    da.OutputStateHistory = "AllTimes"
    da.EveryNSteps = 1
    da.OutputMeasHistory = True
    da.OutputManeuvers = True
    da.OutputEmpiricalForces = True
    da.OutputSummary = True
    da.OutputDataFiles = True
    da.OutputHistograms = True
    da.OutputPerturbations = True

    # Set runtime
    simulator.ProcessControl.TimeSpan.set(timeSpan, "min")

    if runType is RunType.MULTI_TRUTH:
        trialPath = str(
            Path(outputPath) / runName / "Trials" / f"Trial_{str(trialNum)}"
        )
        simulator.Output.Measurements.Filename = str(
            Path(trialPath) / f"{runName}_Trial_{str(trialNum)}.gobs"
        )
        da.Filename = str(Path(trialPath) / f"{runName}_Trial_{str(trialNum)}.simrun")
        simulator.Output.STKEphemeris.OutputDirectory = trialPath
    elif runType is RunType.SINGLE_TRUTH:
        trialPath = str(Path(outputPath) / runName)
        simulator.Output.Measurements.Filename = str(
            Path(trialPath) / f"{runName}_{trialNum}.gobs"
        )
        da.Filename = str(Path(trialPath) / f"{runName}_{trialNum}.simrun")
        simulator.Output.STKEphemeris.OutputDirectory = trialPath
    else:
        sys.exit(f"runType {runType} is not a valid option")

    logtbx.log(logFile, f"Simulator - Output setup in {trialPath}", loglist)

    setSatelliteList(simulator, satNames, logFile)

    logtbx.log(logFile, f"Simulator - {satNames} added to satellite list", loglist)

    simulator.Go()

    logtbx.log(logFile, "Simulator - Finished", loglist)


def runFilter(
    runName: str,
    trialNum: int,
    satNames: Union[list, str],
    filter: AttrProxy,
    filterRunType: str,
    timeSpan: float,
    predictTimeSpan: float,
    predictTimeStep: float,
    logFile: logging.Logger,
    loglist: list,
    outputPath: str,
    startTime="",
) -> Tuple[str, str, float]:
    """Run the filter

    Runs over given time interval (specified in epoch seconds)
    If running over a fit span, filterRunType must be 'Restart' or 'AutoRestart'.
    AutoRestart is preferred and does not require a startTime argument - it
    will use the last available time in the last restart record. 'Restart'
    and 'Initial' will require a start time.
    This function must be run sequentially based on time intervals so that
    the correct restart record is chosen (will always take the last
    created restart record)

    Args:
        runName (str): unique name for the run
        trialNum (int): if multi truth the trial within the run.
        satNames (list or str): name of the satellite(s)
        filter (str): handle on the filter
        filterRunType (str): run type of the filter
        ('Initial', 'Restart', 'AutoRestart')
        timeSpan (float): number of minutes to run the filter
        predictTimeSpan (float): number of minutes to predict ephemeris
        predictTimeStep (float): step size (in minutes) to predict ephemeris
        logFile (typing.TextIO): handle of the logger
        loglist (list): a running list for displayed log messages
        outputPath (str): the path of the directory the analysis is being saved
        startTime (str, optional): a UTCG time to start the filter, this is required if
        the filterRunType is either 'Initial' or 'Restart'. Defaults to "".

    Returns:
        Tuple[str, str, float]: list containing smoother input path, the filter output
        path and the start time used in the folder name (float)
    """
    valid_run_types = ["Initial", "AutoRestart", "Restart", "FullRun"]
    if filterRunType not in valid_run_types:
        sys.exit(
            'Filter run type must be "Restart", "AutoRestart", "FullRun" or "Initial".'
        )
    if filterRunType != "FullRun":
        filter.ProcessControl.StartMode = filterRunType
        if filter.ProcessControl.StartMode.eval() != filterRunType:
            sys.exit(
                "Filter could not be set to run type specified \n"
                "has a restart record been created?"
            )
    else:
        filter.ProcessControl.StartMode = "Initial"
        if filter.ProcessControl.StartMode.eval() != "Initial":
            sys.exit(
                "Filter could not be set to run type specified \n"
                "has a restart record been created?"
            )

    logtbx.log(logFile, f"Filter - RunType set to {filterRunType}", loglist)

    if filterRunType != "AutoRestart":
        try:
            filter.ProcessControl.StartTime.Set(startTime, "UTCG")

            logtbx.log(logFile, f"Filter - StartTime set to {startTime} UTCG", loglist)

        except Exception:
            sys.exit("Start Time could not be set. Was an argument provided?")

    if filterRunType == "AutoRestart":
        startTime = filter.ProcessControl.AutoSelectedRestartTime.value.eval()
        startTime = (startTime.replace("UTCG", "")).strip()
        filter.ProcessControl.StartMode = "Initial"
        filter.ProcessControl.StartTime.Set(startTime, "UTCG")
        startTimeForFolder = round(
            float(str(filter.ProcessControl.StartTime.Format("YYYYMMDD"))), 3
        )
        filter.ProcessControl.StartMode = filterRunType

        logtbx.log(logFile, f"Filter - StartTime set to {startTime} UTCG", loglist)

    elif filterRunType == "Restart":
        startTime = filter.ProcessControl.SelectedRestartTime.value.eval()
        startTime = (startTime.replace("UTCG", "")).strip()
        filter.ProcessControl.StartMode = "Initial"
        filter.ProcessControl.StartTime.Set(startTime, "UTCG")
        startTimeForFolder = round(
            float(str(filter.ProcessControl.StartTime.Format("YYYYMMDD"))), 3
        )
        filter.ProcessControl.StartMode = filterRunType
        filter.ProcessControl.SelectedRestartTime.Set(startTime, "UTCG")

        logtbx.log(logFile, f"Filter - StartTime set to {startTime} UTCG", loglist)

    elif filterRunType == "Initial":
        startTimeForFolder = "Convergence"

    elif filterRunType == "FullRun":
        startTimeForFolder = "FullRun"

    else:
        startTimeForFolder = round(
            float(str(filter.ProcessControl.StartTime.Format("YYYYMMDD"))), 3
        )

    filter.ProcessControl.TimeSpan.set(timeSpan, "min")

    logtbx.log(logFile, f"Filter - Duration set to {timeSpan} min", loglist)

    filter.Output.SmootherData.Generate = True
    filter.Output.STKEphemeris.DuringProcess.Generate = True
    filter.Output.STKEphemeris.Predict.Generate = True
    filter.Output.STKEphemeris.Covariance = True
    da = filter.Output.DataArchive
    da.FileUpdateMethod = "Overwrite"
    da.OutputStateHistory = "AllTimes"
    da.EveryNSteps = 1
    da.OutputMeasHistory = True
    da.OutputManeuvers = True
    da.OutputEmpiricalForces = True
    da.OutputSummary = True
    da.OutputDataFiles = True
    da.OutputHistograms = True
    filter.Output.STKEphemeris.CovarianceType = "Position Velocity 6x6 Covariance"
    filter.Output.STKEphemeris.Predict.TimeSpan.Set(predictTimeSpan, "min")
    filter.Output.STKEphemeris.Predict.TimeStep.Set(predictTimeStep, "min")

    logtbx.log(
        logFile, f"Filter - Predict timespan set to {predictTimeSpan} min", loglist
    )
    logtbx.log(
        logFile, f"Filter - Predict timestep set to {predictTimeStep} min", loglist
    )

    odPath = dmtbx.initOdDirectory(
        runName, trialNum, startTimeForFolder, outputPath, forceOverwrite=True
    )
    filter.Output.DataArchive.Filename = str(
        Path(odPath)
        / f"{runName}_Trial_{str(trialNum)}_{str(startTimeForFolder)}.filrun"
    )
    smootherInputPath = str(
        Path(odPath)
        / f"{runName}_Trial_{str(trialNum)}_{str(startTimeForFolder)}.rough"
    )
    filter.Output.SmootherData.Filename = smootherInputPath
    filter.Output.STKEphemeris.OutputDirectory = odPath

    logtbx.log(logFile, f"Filter - Output directory set to {odPath}", loglist)

    setSatelliteList(filter, satNames, logFile)

    logtbx.log(logFile, f"Filter - {satNames} added to satellite list", loglist)

    filter.Go()

    logtbx.log(logFile, "Filter - Finished", loglist)
    return (smootherInputPath, odPath, startTimeForFolder)


def runSmoother(
    runName: str,
    trialNum: int,
    smoother: AttrProxy,
    filterOut: list,
    predictTimeSpan: float,
    predictTimeStep: float,
    logFile: logging.Logger,
    loglist: list,
):
    """Run the smoother

    Args:
        runName (str): unique name for the run
        trialNum (int): if multi truth the trial within the run.
        smoother (AttrProxy): handle on the smoother object
        filterOut (list): must be list that comes from runFilter
        (or must be populated with the same data)
        predictTimeSpan (float): number of minutes to predict ephemeris
        predictTimeStep (float): step size (in minutes) to predict ephemeris
        logFile (typing.TextIO): handle of the logger
        loglist (list): a running list for displayed log messages
    """
    smoother.Input.Files.clear()
    elem = smoother.Input.Files.NewElem()
    smoother.Input.Files.push_front(elem)
    smoothFileEntry = smoother.Input.Files[0]
    roughFile = filterOut[0]
    smoothFileEntry.Filename = roughFile

    logtbx.log(logFile, f"Smoother - Input file set to {roughFile}", loglist)

    smoother.Output.STKEphemeris.DuringProcess.Generate = True
    smoother.Output.STKEphemeris.Predict.Generate = True
    smoother.Output.STKEphemeris.Covariance = True
    smoother.Output.FilterDifferencingControls.Generate = True

    logtbx.log(logFile, "Smoother - Output configured", loglist)

    da = smoother.Output.DataArchive
    da.OutputStateHistory = "AllTimes"
    da.EveryNSteps = 1
    da.OutputManeuvers = True
    da.OutputEmpiricalForces = True
    da.OutputDataFiles = True
    smoother.Output.STKEphemeris.CovarianceType = "Position Velocity 6x6 Covariance"
    smoother.Output.STKEphemeris.Predict.TimeSpan.Set(predictTimeSpan, "min")
    smoother.Output.STKEphemeris.Predict.TimeStep.Set(predictTimeStep, "min")

    logtbx.log(logFile, f"Smoother - Time span set to {predictTimeSpan} min", loglist)
    logtbx.log(logFile, f"Smoother - Time step set to {predictTimeStep} min", loglist)

    odPath = filterOut[1]
    startTimeForFolder = filterOut[2]
    smoother.Output.DataArchive.Filename = str(
        Path(odPath)
        / f"{runName}_Trial_{str(trialNum)}_{str(startTimeForFolder)}.smtrun"
    )

    logtbx.log(logFile, f"Smoother - Output directory set to {odPath}", loglist)
    smoother.Output.STKEphemeris.OutputDirectory = odPath
    smoother.Output.FilterDifferencingControls.Filename = str(
        Path(odPath)
        / f"{runName}_Trial_{str(trialNum)}_{str(startTimeForFolder)}.difrun"
    )
    smoother.Go()

    logtbx.log(logFile, "Smoother - Finished", loglist)


def setSatelliteList(
    obj: AttrProxy,
    satellites: Union[List[AttrProxy], AttrProxy],
    logFile: logging.Logger,
):
    """Set satellites to be used by the filter, smoother, or simulator

    Args:
        obj (AttrProxy): handle of the object
        satellites (typing.List[AttrProxy] or AttrProxy): satellites to be used
        logFile (typing.TextIO): handle of the log file
    """
    satList = obj.SatelliteList
    satList.clear()
    if isinstance(satellites, list):
        for satellite in satellites:
            satList.InsertByName(satellite.Name.Value.eval())
    elif isinstance(satellites, AttrProxy):
        satList.InsertByName(satellites.Name.Value.eval())
    else:
        logtbx.log(
            logFile,
            f"type {type(satellites)} is not supported for adding to satellite list",
        )
        sys.exit(
            f"type {type(satellites)} is not supported for adding to satellite list"
        )


class MCRun:
    def __init__(
        self,
        scenario: List[AttrProxy],
        inputDict: dict,
        metaDict: dict,
        conv_duration: float,
        pred_duration: float,
        fit_duration: float,
        loglist: list,
        percentComplete: list,
        initState: list,
        initUnc: list,
        deleteEphem: bool,
    ) -> None:
        """main class to run the monte carlo simulation

        call the `run` method to execute the monte carlo simulation
        Args:
            scenario (List[AttrProxy]): handle of the scenario object
            inputDict (dict): input dictionary
            metaDict (dict): meta dictionary
            conv_duration (float): number of minutes to run
            pred_duration (float): number of minutes to predict ephemeris
            fit_duration (float): number of minutes to use as the fit
            loglist (list): a running list for displayed log messages
            percentComplete (list): a running total for the percentage display
            initState (list): array of the initial keplerian elements
            initUnc (list): array of the initial uncertainty values
        """
        self.scenario = scenario
        self.inputDict = inputDict
        self.metaDict = metaDict
        self.conv_duration = conv_duration
        self.pred_duration = pred_duration
        self.fit_duration = fit_duration
        self.runLog = logging.getLogger(metaDict["runName"])
        self.loglist = loglist
        self.percentComplete = percentComplete
        self.initState = initState
        self.initUnc = initUnc
        self.trialComplete = 0
        self.deleteEphem = deleteEphem

    def run(self):
        if self.metaDict["runType"] == RunType.MULTI_TRUTH:
            self._runMultiTruthMC()
        elif self.metaDict["runType"] == RunType.SINGLE_TRUTH:
            self._runSingleTruthMC()
        else:
            sys.exit("Run type not supported")

    def _runMultiTruthMC(self):
        num_trials = self.inputDict["numTrials"]
        num_threads = len(self.scenario)

        threads_start, threads_end = dmtbx._split_tasks_evenly(
            num_threads, num_trials
        )

        threads = []
        for i in range(num_threads):
            threads.append(
                threading.Thread(
                    target=self._multitruth_thread,
                    args=(self.scenario[i], threads_start[i] + 1, threads_end[i] + 1),
                )
            )

        for t in threads:
            t.start()

        for t in threads:
            t.join()

        logtbx.log(self.runLog, f'{" RUN COMPLETE " :#^88}', self.loglist)
        logtbx.log(
            self.runLog, f'{" Starting Post Processing Data Generation"}', self.loglist
        )

        start = time.time()
        runDir = Path(self.metaDict["outputPath"]) / self.metaDict["runName"]
        self.percentComplete[0] =  0
        dmtbx.createFilepathDf(runDir)
        logtbx.log(self.runLog, 'Filepath Data Frame Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createEphemDicts(runDir)
        logtbx.log(self.runLog, 'Ephemeris Dictionary Created', self.loglist)
        dmtbx.createDiffedEphemDicts(runDir)
        logtbx.log(self.runLog, 'Diffed Ephemeris Dictionary Created', self.loglist)
        dmtbx.createDivergedDict(runDir)
        logtbx.log(self.runLog, 'Diverged Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createCovDicts(runDir)
        logtbx.log(self.runLog, 'Covariance Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createNumericalCovDicts(runDir)
        logtbx.log(self.runLog, 'Numerical Covariance Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createMahalanobisDistDicts(runDir)
        logtbx.log(self.runLog, 'Mahalanobis Distance Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createPlots(runDir)
        logtbx.log(self.runLog, 'Plots Created', self.loglist)
        self.percentComplete[0] += 25
        dmtbx.cleanUpDirectory(runDir, self.deleteEphem)
        logtbx.log(self.runLog, 'Directory Cleanup Completed', self.loglist)
        end = time.time()
        logtbx.log(
            self.runLog,
            f"Finished Post Processing Data Generation in {(end-start)/60:.2f} minutes",
            self.loglist,
        )
        return

    def _multitruth_thread(self, scenario, start_index, stop_index):
        for trialNum in range(start_index, stop_index):
            trial_start = time.time()

            trialLog = logging.getLogger(f"trial_{trialNum}")
            trialLog.setLevel(logging.INFO)
            trial_log_file = str(
                Path(self.metaDict["outputPath"])
                / self.metaDict["runName"]
                / "Trials"
                / f"Trial_{trialNum}"
                / "triallog.txt"
            )
            handler = logging.FileHandler(trial_log_file)
            formatter = logging.Formatter("%(asctime)s %(levelname)-8s %(message)s")
            formatter.datefmt = "%Y-%m-%dT%H:%M:%S%z"
            handler.setFormatter(formatter)
            trialLog.addHandler(handler)

            log_msg = f" TRIAL {trialNum} / {self.inputDict['numTrials']} "
            logtbx.log(self.runLog, f"{log_msg :*^88}", self.loglist)

            # Reinitialize satellite setup each iteration
            satellite = satelliteTemplateSelection(
                scen=scenario,
                templateName=self.metaDict["templateSatName"],
                logFile=trialLog,
                loglist=self.loglist,
                initialState=self.initState,
                initialUncertainty=self.initUnc,
            )

            simulator = scenario.Simulator[0]
            facilities = []
            tracking_system = scenario.TrackingSystem[0]
            for i in range(0, tracking_system.children.count + 1):
                facilities.append(tracking_system.Facility[i])
            smoother = scenario.Smoother[0]
            filt = scenario.Filter[0]

            # Simulator setup
            setSatelliteList(obj=simulator, satellites=satellite, logFile=trialLog)
            simtbx.setNoDeviations(
                simulator=simulator, logFile=trialLog, loglist=self.loglist
            )

            if (
                "srp" in self.metaDict["perturbations"]
            ):  # TODO add input dictionary that selects perturbations
                simtbx.varySRP(
                    simulator=simulator,
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                )

            if (
                "bcoef" in self.metaDict["perturbations"]
            ):  # TODO add input dictionary that selects perturbations
                simtbx.varyBCoeff(
                    simulator=simulator,
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                )

            if (
                "measbias" in self.metaDict["perturbations"]
            ):  # TODO add input dictionary that selects perturbations
                simtbx.varyMeasBias(
                    simulator=simulator,
                    facilities=facilities,
                    logFile=trialLog,
                    loglist=self.loglist,
                )

            if (
                "tropobias" in self.metaDict["perturbations"]
            ):  # TODO add input dictionary that selects perturbations
                simtbx.varyTropoBias(
                    simulator=simulator,
                    facilities=facilities,
                    logFile=trialLog,
                    loglist=self.loglist,
                )

            simtbx.assignRandomSeed(
                simulator=simulator, logFile=trialLog, loglist=self.loglist
            )
            # Run Simulator
            runSimulator(
                runName=self.metaDict["runName"],
                simulator=simulator,
                runType=self.metaDict["runType"],
                timeSpan=self.conv_duration
                + self.fit_duration * self.inputDict["numOdPerTrial"],
                logFile=trialLog,
                loglist=self.loglist,
                satNames=satellite,
                outputPath=self.metaDict["outputPath"],
                trialNum=trialNum,
            )
            # Initialize Filter
            filterOutput = runFilter(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                satNames=satellite,
                filter=filt,
                filterRunType="Initial",
                timeSpan=self.conv_duration,
                predictTimeSpan=self.pred_duration,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
                outputPath=self.metaDict["outputPath"],
                startTime=self.metaDict["scenarioStart"],
            )
            runSmoother(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                smoother=smoother,
                filterOut=filterOutput,
                predictTimeSpan=self.pred_duration,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
            )
            for _ in range(1, self.inputDict["numOdPerTrial"] + 1, 1):
                filterOutput = runFilter(
                    runName=self.metaDict["runName"],
                    trialNum=trialNum,
                    satNames=satellite,
                    filter=filt,
                    filterRunType="AutoRestart",
                    timeSpan=self.fit_duration,
                    predictTimeSpan=self.pred_duration,
                    predictTimeStep=self.inputDict["timeStepMin"],
                    logFile=trialLog,
                    loglist=self.loglist,
                    outputPath=self.metaDict["outputPath"],
                )
                runSmoother(
                    runName=self.metaDict["runName"],
                    trialNum=trialNum,
                    smoother=smoother,
                    filterOut=filterOutput,
                    predictTimeSpan=self.pred_duration,
                    predictTimeStep=self.inputDict["timeStepMin"],
                    logFile=trialLog,
                    loglist=self.loglist,
                )
            # Run Full Interval
            filterOutput = runFilter(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                satNames=satellite,
                filter=filt,
                filterRunType="FullRun",
                timeSpan=self.conv_duration
                + self.fit_duration * self.inputDict["numOdPerTrial"],
                predictTimeSpan=0,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
                outputPath=self.metaDict["outputPath"],
                startTime=self.metaDict["scenarioStart"],
            )
            runSmoother(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                smoother=smoother,
                filterOut=filterOutput,
                predictTimeSpan=0,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
            )
            self.trialComplete = self.trialComplete + 1
            self.percentComplete[0] = round(
                self.trialComplete / self.inputDict["numTrials"] * 100
            )
            trial_end = time.time()
            logtbx.log(
                trialLog,
                f"Finished Trial_{trialNum} in {(trial_end-trial_start)/60:.2f} minutes",
                self.loglist,
            )

    def _runSingleTruthMC(self):
        """main method to run the single-truth monte carlo simulation

        Args:
            scenario (AttrProxy): handle of the scenario object
            inputDict (dict): input dictionary
            metaDict (dict): meta dictionary
            conv_duration (float): number of minutes to run
            pred_duration (float): number of minutes to predict ephemeris
            fit_duration (float): number of minutes to use as the fit
            runLog (typing.TextIO): handle of the log file
        """
        num_trials = self.inputDict["numTrials"]
        num_threads = len(self.scenario)

        threads_start, threads_end = dmtbx._split_tasks_evenly(
            num_threads, num_trials
        )

        threads = []
        drawData = {}
        for i in range(num_threads):
            threads.append(
                threading.Thread(
                    target=self._singletruth_thread,
                    name=f"Trials-{threads_start[i] + 1}-{threads_end[i] + 1}",
                    args=(
                        self.scenario[i],
                        threads_start[i] + 1,
                        threads_end[i] + 1,
                        drawData,
                    ),
                )
            )

        for t in threads:
            t.start()

        for t in threads:
            t.join()

        logtbx.log(self.runLog, f'{" RUN COMPLETE " :#^88}', self.loglist)
        logtbx.log(
            self.runLog, f'{" Starting Post Processing Data Generation"}', self.loglist
        )

        start = time.time()
        runDir = Path(self.metaDict["outputPath"]) / self.metaDict["runName"]
        self.percentComplete[0] =  0
        dmtbx.createFilepathDf(runDir)
        logtbx.log(self.runLog, 'Filepath Data Frame Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createDrawDf(runDir, pd.DataFrame.from_dict(drawData))
        logtbx.log(self.runLog, 'Draw Data Frame Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createEphemDicts(runDir)
        logtbx.log(self.runLog, 'Ephemeris Dictionary Created', self.loglist)
        dmtbx.createDiffedEphemDicts(runDir)
        logtbx.log(self.runLog, 'Diffed Ephemeris Dictionary Created', self.loglist)
        dmtbx.createDivergedDict(runDir)
        logtbx.log(self.runLog, 'Diverged Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createCovDicts(runDir)
        logtbx.log(self.runLog, 'Covariance Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createNumericalCovDicts(runDir)
        logtbx.log(self.runLog, 'Numerical Covariance Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createMahalanobisDistDicts(runDir)
        logtbx.log(self.runLog, 'Mahalanobis Dictionary Created', self.loglist)
        self.percentComplete[0] += 15
        dmtbx.createPlots(runDir)
        logtbx.log(self.runLog, 'Plots Created', self.loglist)
        self.percentComplete[0] += 10
        dmtbx.cleanUpDirectory(runDir, self.deleteEphem)
        logtbx.log(self.runLog, 'Directory Cleanup Completed', self.loglist)
        end = time.time()
        logtbx.log(
            self.runLog,
            f"Finished Post Processing Data Generation in {(end-start)/60:.2f} minutes",
            self.loglist,
        )
        return

    def _singletruth_thread(self, scenario, start_index, stop_index, drawData):
        satellite = satelliteTemplateSelection(
            scen=scenario,
            templateName=self.metaDict["templateSatName"],
            logFile=self.runLog,
            loglist=self.loglist,
            initialState=self.initState,
            initialUncertainty=self.initUnc,
        )
        # Run Simulator
        simulator = scenario.Simulator[0]
        simtbx.setSingleTruthDeviations(simulator, self.runLog, self.loglist, self.metaDict["perturbations"])
        runSimulator(
            runName=self.metaDict["runName"],
            simulator=simulator,
            runType=self.metaDict["runType"],
            timeSpan=self.conv_duration
            + self.fit_duration * self.inputDict["numOdPerTrial"],
            logFile=self.runLog,
            loglist=self.loglist,
            satNames=satellite,
            outputPath=self.metaDict["outputPath"],
            trialNum=start_index,
        )
        for trialNum in range(start_index, stop_index):
            trial_start = time.time()
            trialLog = logging.getLogger(f"trial_{trialNum}")
            trialLog.setLevel(logging.INFO)
            trial_log_file = str(
                Path(self.metaDict["outputPath"])
                / self.metaDict["runName"]
                / "Trials"
                / f"Trial_{trialNum}"
                / "trial_log.txt"
            )
            handler = logging.FileHandler(trial_log_file)
            formatter = logging.Formatter(
                "%(asctime)s %(threadName)s %(levelname)-4s %(message)s"
            )
            formatter.datefmt = "%Y-%m-%dT%H:%M:%S%z"
            handler.setFormatter(formatter)
            trialLog.addHandler(handler)

            log_msg = f" TRIAL {trialNum} / {self.inputDict['numTrials']} "
            logtbx.log(self.runLog, f"{log_msg :*^88}", self.loglist)

            # Reinitialize satellite setup each iteration
            satellite = satelliteTemplateSelection(
                scen=scenario,
                templateName=self.metaDict["templateSatName"],
                logFile=trialLog,
                loglist=self.loglist,
                initialState=self.initState,
                initialUncertainty=self.initUnc,
            )

            facilities = []
            tracking_system = scenario.TrackingSystem[0]
            for i in range(0, tracking_system[0].count + 1):
                facilities.append(tracking_system.Facility[i])

            smoother = scenario.Smoother[0]
            filt = scenario.Filter[0]

            trialDrawDict = {}

            if (
                "cram" in self.metaDict["perturbations"]
            ):
                cramData = simtbx.drawCrAM(
                    satellite=satellite, logFile=trialLog, loglist=self.loglist
                )
                trialDrawDict.update(cramData)

            if (
                "cramls" in self.metaDict["perturbations"]
            ):
                cramlongsigmaData = simtbx.drawCrAMLongSigma(
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                    relSigma=0.1,
                )
                trialDrawDict.update(cramlongsigmaData)

            if (
                "cramss" in self.metaDict["perturbations"]
            ): 
                cramshortsigmaData = simtbx.drawCrAMShortSigma(
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                    relSigma=0.1,
                )
                trialDrawDict.update(cramshortsigmaData)

            if (
                "cramhl" in self.metaDict["perturbations"]
            ): 
                cramhalflifeData = simtbx.drawCrAMHalfLife(
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                    relSigma=0.1,
                )
                trialDrawDict.update(cramhalflifeData)

            if (
                "bcoef" in self.metaDict["perturbations"]
            ):
                bcoeffData = simtbx.drawBCoeff(
                    satellite=satellite, logFile=trialLog, loglist=self.loglist
                )
                trialDrawDict.update(bcoeffData)

            if (
                "bcoefls" in self.metaDict["perturbations"]
            ):
                bcoefflongsigmaData = simtbx.drawBCoeffLongSigma(
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                    relSigma=0.1,
                )
                trialDrawDict.update(bcoefflongsigmaData)

            if (
                "bcoefss" in self.metaDict["perturbations"]
            ):
                bcoeffshortsigmaData = simtbx.drawBCoeffShortSigma(
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                    relSigma=0.1,
                )
                trialDrawDict.update(bcoeffshortsigmaData)

            if (
                "bcoefhl" in self.metaDict["perturbations"]
            ):
                bcoeffhalflifeData = simtbx.drawBCoeffHalfLife(
                    satellite=satellite,
                    logFile=trialLog,
                    loglist=self.loglist,
                    relSigma=0.1,
                )
                trialDrawDict.update(bcoeffhalflifeData)

            if (
                "measbias" in self.metaDict["perturbations"]
            ):
                measBiasData = simtbx.drawMeasBias(
                    facilities=facilities, logFile=trialLog, loglist=self.loglist
                )
                trialDrawDict.update(measBiasData)

            drawData.update({f"Trial {trialNum}": trialDrawDict})

            # Initialize Filter
            filterOutput = runFilter(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                satNames=satellite,
                filter=filt,
                filterRunType="Initial",
                timeSpan=self.conv_duration,
                predictTimeSpan=self.pred_duration,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
                outputPath=self.metaDict["outputPath"],
                startTime=self.metaDict["scenarioStart"],
            )
            runSmoother(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                smoother=smoother,
                filterOut=filterOutput,
                predictTimeSpan=self.pred_duration,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
            )
            for _ in range(1, self.inputDict["numOdPerTrial"] + 1, 1):
                filterOutput = runFilter(
                    runName=self.metaDict["runName"],
                    trialNum=trialNum,
                    satNames=satellite,
                    filter=filt,
                    filterRunType="AutoRestart",
                    timeSpan=self.fit_duration,
                    predictTimeSpan=self.pred_duration,
                    predictTimeStep=self.inputDict["timeStepMin"],
                    logFile=trialLog,
                    loglist=self.loglist,
                    outputPath=self.metaDict["outputPath"],
                )
                runSmoother(
                    runName=self.metaDict["runName"],
                    trialNum=trialNum,
                    smoother=smoother,
                    filterOut=filterOutput,
                    predictTimeSpan=self.pred_duration,
                    predictTimeStep=self.inputDict["timeStepMin"],
                    logFile=trialLog,
                    loglist=self.loglist,
                )
            # Run Full Interval
            filterOutput = runFilter(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                satNames=satellite,
                filter=filt,
                filterRunType="FullRun",
                timeSpan=self.conv_duration
                + self.fit_duration * self.inputDict["numOdPerTrial"],
                predictTimeSpan=0,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
                outputPath=self.metaDict["outputPath"],
                startTime=self.metaDict["scenarioStart"],
            )
            runSmoother(
                runName=self.metaDict["runName"],
                trialNum=trialNum,
                smoother=smoother,
                filterOut=filterOutput,
                predictTimeSpan=0,
                predictTimeStep=self.inputDict["timeStepMin"],
                logFile=trialLog,
                loglist=self.loglist,
            )
            simtbx.singleTruthResetDraws(
                facilities=facilities,
                logFile=trialLog,
                loglist=self.loglist,
            )
            self.trialComplete = self.trialComplete + 1
            self.percentComplete[0] = round(
                self.trialComplete / self.inputDict["numTrials"] * 100
            )
            trial_end = time.time()
            logtbx.log(
                trialLog,
                f"Finished Trial_{trialNum} in {(trial_end-trial_start)/60:.2f} minutes",
                self.loglist,
            )
        return drawData
