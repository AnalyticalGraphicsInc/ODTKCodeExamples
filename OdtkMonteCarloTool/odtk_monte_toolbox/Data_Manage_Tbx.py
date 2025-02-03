"""
Functions to create and configure the file structure through which monte carlo data
will be stored. Functions handle folder creation for the Run/Orbit, Trial, and OD levels
of data grouping.

* Runs are characterized by the nominal orbit
* Trials within a run will consist of monte carlo variation in a variety of parameters
over the entire analysis interval.
* OD's are contained in each trial with a consistent fit span that cover the length of
the analysis. OD's of like fit span across all the trials will be used to compute
numerical covariance.
"""

import os
import pickle
import plotly.io
import shutil
import sys
import threading
from pathlib import Path
from typing import List, Tuple

import pandas as pd
import numpy as np

import odtk_monte_toolbox.Data_Processing_Tbx as dptbx
import odtk_monte_toolbox.Logging_Tbx as logtbx
import odtk_monte_toolbox.Run_Tbx as runtbx


def initRunDirectory(
    runName: str, numTrials: int, outputPath: str, forceOverwrite: bool = False
):
    """Create run directory and trial directories

    Args:
        runName (str): name of the run
        numTrials (int): trial number within the run
        outputPath (str): the path that the run directory is saved at
        forceOverwrite (bool, optional): set to True if you want to overwrite existing
        results. Defaults to False.
    """
    trials = range(1, numTrials + 1, 1)
    runPath = Path(outputPath) / runName

    # Create output directory if needed
    if not (Path(outputPath).exists()):
        os.mkdir(outputPath)

    # Create run directory
    if runPath.exists() & forceOverwrite:
        shutil.rmtree(runPath, ignore_errors=True)
        os.mkdir(runPath)
    elif runPath.exists():
        sys.exit(
            f"{str(runPath)} already exists!"
            "Delete the directory or change your desired directory name and run again"
        )
    else:
        os.mkdir(runPath)

    # Create post processing folder
    postProcPath = runPath / "Post_Processing"
    os.mkdir(postProcPath)

    # Create trials folder
    trialsPath = runPath / "Trials"
    os.mkdir(trialsPath)

    # Create trial folders
    for trialNum in trials:
        trialPath = trialsPath / f"Trial_{trialNum}"
        os.mkdir(trialPath)


def initOdDirectory(
    runName: str,
    trialNum: int,
    spanStart: float,
    outputPath: str,
    forceOverwrite: bool = False,
) -> str:
    """Creates an OD directory that will contain data for each fit span

    Args:
        runName (str): name of the run
        trialNum (int): trial number within the run
        spanStart (float): the start time of the trial in minutes
        outputPath (str): the path that the run directory is saved at
        forceOverwrite (bool, optional): _description_. Defaults to False.

    Returns:
        str: path to store OD files for this specific trial
    """
    trialPath = Path(outputPath) / runName / "Trials" / f"Trial_{trialNum}"

    if not trialPath.exists():
        raise FileNotFoundError(
            f"{trialPath} does not exist please check your trial number and try again"
        )
    odPath = trialPath / f"OD_{spanStart}"

    if odPath.exists() & forceOverwrite:
        shutil.rmtree(odPath, ignore_errors=True)
        os.mkdir(odPath)
    elif odPath.exists():
        sys.exit(
            f"{odPath} already exists!"
            "Delete the directory or change your desired directory name and run again"
        )
    else:
        os.mkdir(odPath)
    return str(odPath)


def createFilepathDf(runDir: Path):
    """Create data frame with filepaths to each ephemeris file of consequence within a
    completed run.Use getEphemDF in data processing toolbox to retrieve pickle.

    Args:
        runDir (Path): the folder for this run
    """
    # Determine run directory
    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )
    # Open input and meta dictionary files
    inputDict = logtbx.getInputDictionary(runDir)
    metaDict = logtbx.getMetaDictionary(runDir)
    # Determine number of trials and run type
    numTrials = inputDict["numTrials"]
    runType = metaDict["runType"]
    # Gather folder names for each OD

    # Get truth ephemeris if single truth
    if runType == runtbx.RunType.SINGLE_TRUTH:
        # filenames = os.walk(runDir).next()[2]
        filenames = os.listdir(str(runDir))
        for fileName in filenames:
            path = runDir / fileName
            if path.is_file():
                if "MC_" in fileName:
                    truthEphem = str(runDir / fileName)
                    break

    # Loop each trial creating a data frame of ephemeris file paths
    ephemList = []
    for trialNum in range(1, numTrials + 1):
        # Get path to trial directory
        trialPath = runDir / "Trials" / f"Trial_{trialNum}"
        odDirs = next(os.walk(str(trialPath)))[1]

        # Get truth ephemeris if multi truth
        if runType == runtbx.RunType.MULTI_TRUTH:
            # filenames = os.walk(trialPath).next()[2]
            filenames = os.listdir(str(trialPath))
            for fileName in filenames:
                path = trialPath / fileName
                if path.is_file():
                    if "MC_" in fileName:
                        truthEphem = str(trialPath / fileName)
                        break

        # Loop through each OD directory to gather ephem files
        for odName in odDirs:
            if "OD_" in odName:
                odPath = trialPath / odName
                # fileNames = os.walk(odPath).next()[2]
                filenames = os.listdir(str(odPath))
                # Check each file in directory for filter and smoother ephem files
                for fileName in filenames:
                    path = odPath / fileName
                    if path.is_file():
                        if "_Fil_" in fileName:
                            filEphem = str(odPath / fileName)
                        elif "_Smooth_" in fileName:
                            smoothEphem = str(odPath / fileName)
                ephemList.append([trialNum, odName, truthEphem, filEphem, smoothEphem])

    # Create ephemeris data frame
    ephemLocations = pd.DataFrame(
        ephemList, columns=["trialNum", "spanNum", "truthPath", "filPath", "smoothPath"]
    )
    ephemPicklePath = runDir / "Post_Processing" / "ephemLocations.pkl"
    ephemLocations.to_pickle(ephemPicklePath)


def createDrawDf(runDir: Path, drawDf: pd.DataFrame):
    """Create data frame/pickle with data about perturbation draws by trial and save to
    post processing folder. Use getDrawDF in data processing toolbox to retrieve pickle.

    Args:
        runDir (Path): the folder for this run
        drawDf (pd.DataFrame): data frame of perturbation draws by trial
    """
    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )

    drawPicklePath = runDir / "Post_Processing" / "drawData.pkl"
    # Reorder columns
    cols = [f"Trial {i+1}" for i in range(len(drawDf.columns))]
    drawDf = drawDf[cols]
    # Save to pickle file
    drawDf.to_pickle(drawPicklePath)


def createEphemDicts(runDir: Path):
    """Create dictionaries that include the predicted and fit ephemeris for both Filter
    and Smoother as well as the truth ephemeris.

    Args:
        runDir (Path): the folder for this run
    """
    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )

    # Gather all of the relevant dictionaries
    metaDict = logtbx.getMetaDictionary(runDir)
    inputDict = logtbx.getInputDictionary(runDir)
    ephemDf = dptbx.getFilepathDf(runDir)

    ephems = ephemDf[
        (ephemDf["spanNum"] != "OD_FullRun") & (ephemDf["spanNum"] != "OD_Convergence") & (ephemDf['spanNum'].str.startswith('OD'))
    ]

    predFilterEphemDict = {}
    fitFilterEphemDict = {}
    fitSmootherEphemDict = {}
    truthEphemDict = {}

    for trial in range(1, inputDict["numTrials"] + 1):
        tempEphems = ephems.loc[ephems["trialNum"] == trial].reset_index(drop=True)
        truth_time, truth_ephem, truth_cat = dptbx.readEphemerisTimePosVel(
            tempEphems["truthPath"][0]
        )
        filterPredTime = []
        filterPredEphem = []
        filterFitTime = []
        filterFitEphem = []
        smootherFitTime = []
        smootherFitEphem = []
        for od in range(len(tempEphems.index)):
            # Filter Predict
            time, ephem, cat = dptbx.readEphemerisTimePosVel(
                tempEphems["filPath"][od], metaDict["fit_dur_sec"]
            )
            fitIndices = [i for i in range(len(cat)) if cat[i] == "Fit"]
            predIndices = [i for i in range(len(cat)) if cat[i] == "Predict"]

            # Don't append final predict because it's out of truth span
            if od != len(tempEphems.index)-1:
                # Filter predict appending
                timeUnique, indices = np.unique(time[predIndices], return_index=True)            
                filterPredTime.append(
                    timeUnique
                    + metaDict["conv_dur_sec"]
                    + metaDict["fit_dur_sec"] * (od)
                )
                filterPredEphem.append(ephem[predIndices, :][indices])

            # Filter fit appending
            timeUnique, indices = np.unique(time[fitIndices], return_index=True) 
            filterFitTime.append(
                timeUnique
                + metaDict["conv_dur_sec"]
                + metaDict["fit_dur_sec"] * (od)
            )
            filterFitEphem.append(ephem[fitIndices, :][indices])

            # Smoother fit appending
            time, ephem, cat = dptbx.readEphemerisTimePosVel(
                tempEphems["smoothPath"][od], metaDict["fit_dur_sec"], isSmoother=True
            )
            fitIndices = [i for i in range(len(cat)) if cat[i] == "Fit"]
            timeUnique, indices = np.unique(time[fitIndices], return_index=True)
            smootherFitTime.append(
                timeUnique
                + metaDict["conv_dur_sec"]
                + metaDict["fit_dur_sec"] * (od)
            )
            smootherFitEphem.append(ephem[fitIndices, :][indices])

        # Add ephems to lists
        filPredTime, indices = np.unique(
            np.concatenate(filterPredTime), return_index=True
        )
        filPredEphem = np.vstack(filterPredEphem)[indices, :]
        predFilterEphemDict[trial] = (filPredTime, filPredEphem)

        filFitTime, indices = np.unique(
            np.concatenate(filterFitTime), return_index=True
        )
        filFitEphem = np.vstack(filterFitEphem)[indices, :]
        fitFilterEphemDict[trial] = (filFitTime, filFitEphem)

        smoFitTime, indices = np.unique(
            np.concatenate(smootherFitTime), return_index=True
        )
        smoFitEphem = np.vstack(smootherFitEphem)[indices, :]
        fitSmootherEphemDict[trial] = (smoFitTime, smoFitEphem)

        truthEphemDict[trial] = (truth_time, truth_ephem)

    # Save all of the pickle files
    filPredPicklePath = runDir / "Post_Processing" / "filPredEphem.pkl"
    with filPredPicklePath.open("wb") as file:
        pickle.dump(predFilterEphemDict, file)

    filFitPicklePath = runDir / "Post_Processing" / "filFitEphem.pkl"
    with filFitPicklePath.open("wb") as file:
        pickle.dump(fitFilterEphemDict, file)

    smoFitPicklePath = runDir / "Post_Processing" / "smoFitEphem.pkl"
    with smoFitPicklePath.open("wb") as file:
        pickle.dump(fitSmootherEphemDict, file)

    truthPicklePath = runDir / "Post_Processing" / "truthEphem.pkl"
    with truthPicklePath.open("wb") as file:
        pickle.dump(truthEphemDict, file)


def createDiffedEphemDicts(runDir: Path):
    """Create dictionaries that include ephemeris diffed against truth with
    timescales that are relative to the start of the fitspan.

    Args:
        runDir (Path): the folder for this run
    """
    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )

    # Gather all of the relevant dictionaries
    metaDict = logtbx.getMetaDictionary(runDir)
    inputDict = logtbx.getInputDictionary(runDir)
    predContFilterEphemDict = dptbx.getFilterPredEphem(runDir)
    truthEphemDict = dptbx.getTruthEphem(runDir)

    all_times = []
    all_trials = []
    all_diffs = []
    all_spans = []
    predSpanDict = {}

    # 0:1436 then 1437:2872 then 2873:4308 then 4309:5744
    subtimes = np.zeros(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60)) + 1)
    fitspans = np.ones(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60)) + 1)
    for i in range(inputDict['numOdPerTrial']-2):
        new = np.ones(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60))) * metaDict['pred_dur_sec'] * (i+1)
        subtimes = np.append(subtimes, new)
        newfits = np.ones(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60))) * (i+2)
        fitspans = np.append(fitspans,newfits)

    trial_num = 1
    for trial, data in predContFilterEphemDict.items():

        ttimes_orig = truthEphemDict[trial][0]
        tephem_orig = truthEphemDict[trial][1]
        ttimes = np.array([ttimes_orig[i] for i in range(len(ttimes_orig)) if np.isin(ttimes_orig[i],data[0])])
        tephem = np.array([tephem_orig[i].tolist() for i in range(len(ttimes_orig)) if np.isin(ttimes_orig[i],data[0])])
        ttimes -= ttimes[0]

        diffarray = data[1] - tephem
        fittimes = ttimes - subtimes
        all_trials.append(np.ones(len(fittimes)) * trial_num)
        all_spans.append(fitspans)
        all_times.append(fittimes)
        all_diffs.append(diffarray)

        trial_num += 1

        print(f'Trial {trial}')

    predSpanDict['times'] = np.hstack(all_times)
    predSpanDict['trials'] = np.hstack(all_trials)
    predSpanDict['spans'] = np.hstack(all_spans)
    predSpanDict['diffs'] = np.vstack(all_diffs)

    filPredSpanPicklePath = runDir / "Post_Processing" / "filPredSpanDiffs.pkl"
    with filPredSpanPicklePath.open("wb") as file:
        pickle.dump(predSpanDict, file)


def createDivergedDict(runDir: Path, divThreshold: int = 1000, divPct: float = 0.1):
    """Create a dictionary of trial numbers and their divergence status, determined by
    the delta between the position deltas in the first and last fitspans. If divPct of
    of the diffs between the first and last fitspans are greater than divThreshold

    Args:
        runDir (Path): the folder for this run
        divThreshold (int, optional): in meters the threshold for determining a diverged
        data point in the difference between the position truth deltas from the first to
        last fitspans. Defaults to 1000 m.
        divPct (float, optional): the percentage of points that violate the divThreshold
        for a trail to be deemed 'diverged'. Defaults to 0.1 (10%).
    """
    inputDict = logtbx.getInputDictionary(runDir)
    filpreddiff = dptbx.getFilterPredSpanDiffs(runDir)

    ### Determine Diverged Trials ###
    converged = {}
    maxspan = inputDict['numOdPerTrial'] - 1
    for trial in np.unique(filpreddiff['trials']):
        first = filpreddiff['diffs'][(filpreddiff['trials'] == trial) & (filpreddiff['spans'] == 1)]
        last = filpreddiff['diffs'][(filpreddiff['trials'] == trial) & (filpreddiff['spans'] == maxspan)]
        delta = abs(last-first[1:,:])
        if np.mean(sum(delta[:,0:3] > 1000)) > 0.1 * delta.shape[0]:
            converged[int(trial)] = 'Diverged'
        else:
            converged[int(trial)] = 'Converged'

    # Save all of the pickle files
    filDivPicklePath = runDir / "Post_Processing" / "filterDiverged.pkl"
    with filDivPicklePath.open("wb") as file:
        pickle.dump(converged, file)

def createCovDicts(runDir: Path):
    """Create dictionaries that include the covariance for both Filter and
    Smoother. All covariance in sigma rho format

    Args:
        runDir (Path): the folder for this run
        ricConvert (bool, optional): whether or not to convert the covariance into ric.
        Defaults to True.
        sigrho (bool, optional): whether or not to convert the covariance into sigma rho
        format. Defaults to True.
    """
    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )

    # Gather all of the relevant dictionaries
    metaDict = logtbx.getMetaDictionary(runDir)
    inputDict = logtbx.getInputDictionary(runDir)
    ephemDf = dptbx.getFilepathDf(runDir)

    ephems = ephemDf[
        (ephemDf["spanNum"] != "OD_FullRun") & (ephemDf["spanNum"] != "OD_Convergence")
    ]

    predFilterCovDict = {}
    fitFilterCovDict = {}
    fitSmootherCovDict = {}
    predFilterCovSigRhoDict = {}
    fitFilterCovSigRhoDict = {}
    fitSmootherCovSigRhoDict = {}

    for trial in range(1, inputDict["numTrials"] + 1):
        tempEphems = ephems[ephems["trialNum"] == trial].reset_index(drop=True)
        filterPredTime = []
        filterPredCov = []
        filterPredSigRhoCov = []
        filterFitTime = []
        filterFitCov = []
        filterFitSigRhoCov = []
        smootherFitTime = []
        smootherFitCov = []
        smootherFitSigRhoCov = []
        for od in range(len(tempEphems.index)):
            # Filter Covariance
            time, cov, cat = dptbx.readCovarianceTimePosVel(
                tempEphems["filPath"][od], metaDict["fit_dur_sec"]
            )
            _, ephem, _ = dptbx.readEphemerisTimePosVel(
                tempEphems["filPath"][od], metaDict["fit_dur_sec"]
            )
            riccov = dptbx.convertICRFCovToRIC(ephem, cov)
            sigrhocov = dptbx.convertCovToSigRho(riccov)
                
            fitIndices = [i for i in range(len(cat)) if cat[i] == "Fit"]
            predIndices = [i for i in range(len(cat)) if cat[i] == "Predict"]

            # Don't append final predict because it's out of truth span
            if od != len(tempEphems.index)-1:
                filterPredTime.append(
                    time[predIndices]
                    + metaDict["conv_dur_sec"]
                    + metaDict["fit_dur_sec"] * (od)
                )
                filterPredSigRhoCov.append(sigrhocov[predIndices, :])
                filterPredCov.append(riccov[predIndices, :])

            filterFitTime.append(
                time[fitIndices]
                + metaDict["conv_dur_sec"]
                + metaDict["fit_dur_sec"] * (od)
            )
            filterFitSigRhoCov.append(sigrhocov[fitIndices, :])
            filterFitCov.append(riccov[fitIndices, :])

            # Smoother Covariance
            time, cov, cat = dptbx.readCovarianceTimePosVel(
                tempEphems["smoothPath"][od], metaDict["fit_dur_sec"], isSmoother=True
            )
            _, ephem, _ = dptbx.readEphemerisTimePosVel(
                tempEphems["smoothPath"][od],
                metaDict["fit_dur_sec"],
                isSmoother=True,
            )
            riccov = dptbx.convertICRFCovToRIC(ephem, cov)
            sigrhocov = dptbx.convertCovToSigRho(riccov)
            fitIndices = [i for i in range(len(cat)) if cat[i] == "Fit"]
            smootherFitTime.append(
                time[fitIndices]
                + metaDict["conv_dur_sec"]
                + metaDict["fit_dur_sec"] * (od)
            )
            smootherFitSigRhoCov.append(sigrhocov[fitIndices, :])
            smootherFitCov.append(riccov[fitIndices, :])
            print(f'Trial {trial} OD {od}')

        # Add trial covariances to dictionary
        filPredTime, indices = np.unique(
            np.concatenate(filterPredTime), return_index=True
        )
        # 6 by 6 covariance
        filPredCov = np.vstack(filterPredCov)[indices, :]
        predFilterCovDict[trial] = (filPredTime, filPredCov)
        # sigma rho covariance
        filPredSigRhoCov = np.vstack(filterPredSigRhoCov)[indices, :]
        predFilterCovSigRhoDict[trial] = (filPredTime, filPredSigRhoCov)

        filFitTime, indices = np.unique(
            np.concatenate(filterFitTime), return_index=True
        )
        # 6 by 6
        filFitCov = np.vstack(filterFitCov)[indices, :]
        fitFilterCovDict[trial] = (filFitTime, filFitCov)
        # Sig rho
        filFitSigRhoCov = np.vstack(filterFitSigRhoCov)[indices, :]
        fitFilterCovSigRhoDict[trial] = (filFitTime, filFitSigRhoCov)

        smoFitTime, indices = np.unique(
            np.concatenate(smootherFitTime), return_index=True
        )
        # 6 by 6
        smoFitCov = np.vstack(smootherFitCov)[indices, :]
        fitSmootherCovDict[trial] = (smoFitTime, smoFitCov)   
        # Sig rho
        smoFitSigRhoCov = np.vstack(smootherFitSigRhoCov)[indices, :]
        fitSmootherCovSigRhoDict[trial] = (smoFitTime, smoFitSigRhoCov) 

    # Save all of the pickle files
    filPredPicklePath = runDir / "Post_Processing" / "filPredCovSigRho.pkl"
    with filPredPicklePath.open("wb") as file:
        pickle.dump(predFilterCovSigRhoDict, file)

    filFitPicklePath = runDir / "Post_Processing" / "filFitCovSigRho.pkl"
    with filFitPicklePath.open("wb") as file:
        pickle.dump(fitFilterCovSigRhoDict, file)

    smoFitPicklePath = runDir / "Post_Processing" / "smoFitCovSigRho.pkl"
    with smoFitPicklePath.open("wb") as file:
        pickle.dump(fitSmootherCovSigRhoDict, file)

    filPredPicklePath = runDir / "Post_Processing" / "filPredCov.pkl"
    with filPredPicklePath.open("wb") as file:
        pickle.dump(predFilterCovDict, file)

    filFitPicklePath = runDir / "Post_Processing" / "filFitCov.pkl"
    with filFitPicklePath.open("wb") as file:
        pickle.dump(fitFilterCovDict, file)

    smoFitPicklePath = runDir / "Post_Processing" / "smoFitCov.pkl"
    with smoFitPicklePath.open("wb") as file:
        pickle.dump(fitSmootherCovDict, file)


def createNumericalCovDicts(runDir: Path):
    """Create dictionaries for numerical covariance based on filter and smoother
    fitspan and predict intervals. Returns in ICRF.

    Args:
        runDir (Path): the folder for this run
    """
    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )

    # Pull ephemeris data
    filpred = dptbx.getFilterPredEphem(runDir)
    filfit = dptbx.getFilterFitEphem(runDir)
    smofit = dptbx.getSmootherFitEphem(runDir)

    # Pull diverged dict
    diverged = dptbx.getDivergedDict(runDir)

    # Compute numerical covariance
    filprednumcov = dptbx.computeNumericalCovariance(filpred, diverged)
    filfitnumcov = dptbx.computeNumericalCovariance(filfit, diverged)
    smofitnumcov = dptbx.computeNumericalCovariance(smofit, diverged)

    # Save off to pickle files
    filPredPicklePath = runDir / "Post_Processing" / "filPredNumericalCov.pkl"
    with filPredPicklePath.open("wb") as file:
        pickle.dump(filprednumcov, file)

    filFitPicklePath = runDir / "Post_Processing" / "filFitNumericalCov.pkl"
    with filFitPicklePath.open("wb") as file:
        pickle.dump(filfitnumcov, file)

    smoFitPicklePath = runDir / "Post_Processing" / "smoFitNumericalCov.pkl"
    with smoFitPicklePath.open("wb") as file:
        pickle.dump(smofitnumcov, file)

def createMahalanobisDistDicts(runDir: Path):

    # Create filter predict mahalanobis distance
    filpredephem = dptbx.getFilterPredEphem(runDir)
    truthephem = dptbx.getTruthEphem(runDir)
    filpredcov = dptbx.getFilterPredCov(runDir)
    metaDict = logtbx.getMetaDictionary(runDir)
    inputDict = logtbx.getInputDictionary(runDir)

    all_times = []
    all_trials = []
    all_mahals = []
    all_spans = []
    mahalFilPredDict = {}

    # 0:1436 then 1437:2872 then 2873:4308 then 4309:5744
    subtimes = np.zeros(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60)) + 1)
    fitspans = np.ones(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60)) + 1)
    for i in range(inputDict['numOdPerTrial']-2):
        new = np.ones(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60))) * metaDict['pred_dur_sec'] * (i+1)
        subtimes = np.append(subtimes, new)
        newfits = np.ones(int(metaDict['pred_dur_sec'] / (inputDict['timeStepMin'] * 60))) * (i+2)
        fitspans = np.append(fitspans,newfits)

    # TODO: Remove trial_num
    trial_num = 1
    for trial, data in filpredephem.items():

        ttimes_orig = truthephem[trial][0]
        tephem_orig = truthephem[trial][1]
        mask = np.isin(ttimes_orig,data[0])
        ttimes = ttimes_orig[mask]
        tephem = tephem_orig[mask]
        ttimes -= ttimes[0]

        diffarray = data[1] - tephem
        fittimes = ttimes - subtimes
        cov = filpredcov[trial][1]
        mahal = np.sqrt(
            np.einsum("ij, ijk, ik -> i", diffarray, np.linalg.pinv(cov), diffarray)
        )
        all_trials.append(np.ones(len(fittimes)) * trial_num)
        all_spans.append(fitspans)
        all_times.append(fittimes)
        all_mahals.append(mahal)

        trial_num += 1
        print(f'First Mahalanobis Trial {trial}')

    mahalFilPredDict['times'] = np.hstack(all_times)
    mahalFilPredDict['trials'] = np.hstack(all_trials)
    mahalFilPredDict['spans'] = np.hstack(all_spans)
    mahalFilPredDict['mahal'] = np.hstack(all_mahals)

    filPredMahalPicklePath = runDir / "Post_Processing" / "filPredMahal.pkl"
    with filPredMahalPicklePath.open("wb") as file:
        pickle.dump(mahalFilPredDict, file)

    # Create smoother full run mahalanobis distance (legacy plot support)
    ephemDf = dptbx.getFilepathDf(runDir)
    divergedDict = dptbx.getDivergedDict(runDir)
    fullDf = ephemDf[ephemDf["spanNum"] == "OD_FullRun"].set_index("trialNum")

    for trial in range(len(fullDf)):
        truth_time, truth_pos, _ = dptbx.readEphemerisTimePosVel(
            fullDf["truthPath"].iloc[trial]
        )
        _, pos, _ = dptbx.readEphemerisTimePosVel(
            fullDf["smoothPath"].iloc[trial], isSmoother=True
        )
        _, cov, _ = dptbx.readCovarianceTimePosVel(
            fullDf["smoothPath"].iloc[trial], isSmoother=True
        )

        if trial == 0:
            mahalData = pd.DataFrame(truth_time, columns=["Time"])

        # Mahalanobis
        delta = truth_pos - pos
        # use pseudo inv np.linalg.pinv instead of inv

        lab = f"Trial {trial+1}"
        mahalData[lab] = np.sqrt(
            np.einsum("ij, ijk, ik -> i", delta, np.linalg.pinv(cov), delta)
        )
        if divergedDict[trial+1] == 'Diverged':
            mahalData[lab] *= 0
        
        print(f'Second Mahalanobis Trial {trial}')

    mahalPath = runDir / "Post_Processing" / "smoFullMahal.pkl"
    with mahalPath.open("wb") as file:
        pickle.dump(mahalData, file)

def createPlots(runDir: Path, plots_to_gen: List[str] = None):
    """Create the plots to later be loaded in the GUI analysis tab

    Args:
        runDir (Path): the folder for this run
        plots_to_gen (List[str], optional): A list of the string names of plots you want
        to generate. Defaults to all of the plots available to generate.
    """

    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )
    if plots_to_gen is None:
        plots_to_gen = [
            "position_error",
            "mahalanobis_distance",
            "mean_cov_fil_pred",
            "mean_cov_fil_fit",
            "mean_cov_smo_fit",
            "fil_pred_cdf",
            "mahal_filpred_cdf"
        ]

    threads_start, threads_stop = _split_tasks_evenly(6, len(plots_to_gen))

    gen_plots_threads = []
    for i in range(6):
        gen_plots_threads.append(
            threading.Thread(
                target=_generate_plot,
                args=(plots_to_gen[threads_start[i] : threads_stop[i]], runDir),
                name=f"Plots: {plots_to_gen[threads_start[i]:threads_stop[i]]}",
            )
        )

    for thread in gen_plots_threads:
        thread.start()
        thread.join()


def cleanUpDirectory(runDir: Path, delete_ephemeris: bool = False):

    if not runDir.exists():
        raise FileNotFoundError(
            f"{runDir} does not exist please check your runName and try again"
        )
    
    for item in runDir.glob("**/*"):
        if item.suffix == ".sco":
            item.unlink()
        elif item.suffix == ".bin":
            item.unlink()
        elif item.suffix == ".gobs":
            item.unlink()
        elif item.suffix == ".ref":
            item.unlink()
        elif item.suffix == ".simrun":
            item.unlink()
        elif item.suffix == ".filrun":
            item.unlink()
        elif item.suffix == ".difrun":
            item.unlink()
        elif item.suffix == ".smtrun":
            item.unlink()
        elif item.suffix == ".rough":
            item.unlink()
        elif item.is_file() and "FilterLog_" in str(item):
            item.unlink()
        elif delete_ephemeris and item.suffix == ".e":
            item.unlink()
        elif delete_ephemeris and item.is_dir() and "OD_" in str(item):
            shutil.rmtree(item)
        elif item.is_dir() and "_smtrun" in str(item):
            shutil.rmtree(item)
        elif item.is_dir() and "_filrun" in str(item):
            shutil.rmtree(item)
        elif item.is_dir() and "_difrun" in str(item):
            shutil.rmtree(item)
        elif item.is_dir() and "_simrun" in str(item):
            shutil.rmtree(item)
        elif item.is_dir() and "Restart" in str(item):
            shutil.rmtree(item)



def _split_tasks_evenly(
    num_threads: int, num_processes: int
) -> Tuple[List[int], List[int]]:
    """Helper method to event split indices for tasks to be threaded

    Args:
        num_threads (int): the number of parallel threads you want to run
        num_processes (int): the total number of computations to spread across the
        number of threads

    Returns:
        Tuple[List[int], List[int]]: A list of starting indices and a list of stopping
        indices
    """
    processes_per_thread = int(num_processes / num_threads)
    remainder = num_processes % num_threads

    start = []
    end = []
    last_index_assigned = 0
    # Assign one extra processes per thread for the first remainder of threads to
    # evenly distribute the processes
    for _ in range(remainder):
        start.append(last_index_assigned)
        last_index_assigned = last_index_assigned + processes_per_thread + 1
        end.append(last_index_assigned)

    for _ in range(remainder + 1, num_threads + 1):
        start.append(last_index_assigned)
        last_index_assigned = last_index_assigned + processes_per_thread
        end.append(last_index_assigned)

    return (start, end)


def _generate_plot(plot_names: List[str], run_dir: Path, include_plotly: bool = False):
    """Method to call plot generation and save them to json and html

    Args:
        plot_names (List[str]): A list of which plots to generate
        run_dir (Path): the folder for this run
        include_plotly (bool, optional): if cdn plotly can be used. Deafults to "True"
    """

    plotly.io.json.config.default_engine = 'orjson'

    if include_plotly:
        plotly_source = True
    else:
        plotly_source = 'cdn'

    engine = "orjson"

    plots_dir = run_dir / "Post_Processing" / "Plots"

    if not plots_dir.exists():
        os.mkdir(plots_dir)

    for plot_name in plot_names:
        if plot_name == "position_error":
            figure_pos = dptbx.plotPositionError(run_dir)
            figure_pos.write_json(str(plots_dir / "position_error.json"))
            figure_pos.write_html(str(plots_dir / "position_error.html"), include_plotlyjs = plotly_source)

        elif plot_name == "mahalanobis_distance":
            figure_mah = dptbx.plotMahalanobisDistance(run_dir)
            figure_mah.write_json(
                str(plots_dir / "mahalanobis_distance.json"), engine=engine
            )
            figure_mah.write_html(str(plots_dir / "mahalanobis_distance.html"), include_plotlyjs = plotly_source)

        elif plot_name == "mean_cov_fil_pred":
            figure_cov_fil_pred, figure_cov_fil_pred_num, figure_cov_fil_pred_delta = dptbx.plotMeanCovariance(
                run_dir, covType="Filter Predict"
            )
            figure_cov_fil_pred.write_json(
                str(plots_dir / "mean_cov_fil_pred.json"), engine=engine
            )
            figure_cov_fil_pred.write_html(str(plots_dir / "mean_cov_fil_pred.html"), include_plotlyjs = plotly_source)

            figure_cov_fil_pred_num.write_json(
                str(plots_dir / "mean_cov_fil_pred_num.json"), engine=engine
            )
            figure_cov_fil_pred_num.write_html(
                str(plots_dir / "mean_cov_fil_pred_num.html"), include_plotlyjs = plotly_source
            )

            figure_cov_fil_pred_delta.write_json(
                str(plots_dir / "mean_cov_fil_pred_delta.json"), engine=engine
            )
            figure_cov_fil_pred_delta.write_html(
                str(plots_dir / "mean_cov_fil_pred_delta.html"), include_plotlyjs = plotly_source
            )

        elif plot_name == "mean_cov_fil_fit":
            figure_cov_fil_fit, figure_cov_fil_fit_num, figure_cov_fil_fit_delta = dptbx.plotMeanCovariance(
                run_dir, covType="Filter Fit"
            )
            figure_cov_fil_fit.write_json(
                str(plots_dir / "mean_cov_fil_fit.json"), engine=engine
            )
            figure_cov_fil_fit.write_html(str(plots_dir / "mean_cov_fil_fit.html"), include_plotlyjs = plotly_source)

            figure_cov_fil_fit_num.write_json(
                str(plots_dir / "mean_cov_fil_fit_num.json"), engine=engine
            )
            figure_cov_fil_fit_num.write_html(
                str(plots_dir / "mean_cov_fil_fit_num.html"), include_plotlyjs = plotly_source
            )

            figure_cov_fil_fit_delta.write_json(
                str(plots_dir / "mean_cov_fil_fit_delta.json"), engine=engine
            )
            figure_cov_fil_fit_delta.write_html(
                str(plots_dir / "mean_cov_fil_fit_delta.html"), include_plotlyjs = plotly_source
            )

        elif plot_name == "mean_cov_smo_fit":
            figure_cov_smo_fit, figure_cov_smo_fit_num, figure_cov_smo_fit_delta = dptbx.plotMeanCovariance(
                run_dir, covType="Smoother Fit"
            )
            figure_cov_smo_fit.write_json(
                str(plots_dir / "mean_cov_smo_fit.json"), engine=engine
            )
            figure_cov_smo_fit.write_html(str(plots_dir / "mean_cov_smo_fit.html"), include_plotlyjs = plotly_source)

            figure_cov_smo_fit_num.write_json(
                str(plots_dir / "mean_cov_smo_fit_num.json"), engine=engine
            )
            figure_cov_smo_fit_num.write_html(
                str(plots_dir / "mean_cov_smo_fit_num.html"), include_plotlyjs = plotly_source
            )

            figure_cov_smo_fit_delta.write_json(
                str(plots_dir / "mean_cov_smo_fit_delta.json"), engine=engine
            )
            figure_cov_smo_fit_delta.write_html(
                str(plots_dir / "mean_cov_smo_fit_delta.html"), include_plotlyjs = plotly_source
            )

        elif plot_name == "fil_pred_cdf":
            figure_fil_pred_cdf_pos = dptbx.plotDistanceCDF(run_dir, diffType='Filter Predict', diffElement='pos_diff', plotType='plotly')
            figure_fil_pred_cdf_pos.write_json(
                str(plots_dir / "fil_pred_cdf_pos.json"), engine=engine
            )
            figure_fil_pred_cdf_pos.write_html(
                str(plots_dir / "fil_pred_cdf_pos.html"), include_plotlyjs = plotly_source
            )

            figure_fil_pred_cdf_vel = dptbx.plotDistanceCDF(run_dir, diffType='Filter Predict', diffElement='vel_diff', plotType='plotly')
            figure_fil_pred_cdf_vel.write_json(
                str(plots_dir / "fil_pred_cdf_vel.json"), engine=engine
            )
            figure_fil_pred_cdf_vel.write_html(
                str(plots_dir / "fil_pred_cdf_vel.html"), include_plotlyjs = plotly_source
            )

        elif plot_name == "mahal_filpred_cdf":
            figure_mahal_filpred_cdf = dptbx.plotDistanceCDF(run_dir, diffType='Mahal',diffElement='mahaldist',plotType='plotly')

            figure_mahal_filpred_cdf.write_json(
                str(plots_dir / "mahal_filpred_cdf.json"), engine=engine
            )
            figure_mahal_filpred_cdf.write_html(
                str(plots_dir / "mahal_filpred_cdf.html"), include_plotlyjs = plotly_source
            )
