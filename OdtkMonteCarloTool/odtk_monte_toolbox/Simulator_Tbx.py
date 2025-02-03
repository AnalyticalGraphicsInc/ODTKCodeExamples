"""
Functions for configuring the simulator object within ODTK.  Each subsequent run of the
Monte Carlo will require the simulator to be re-seeded and reconfigured
"""

import logging
import random
import statistics
from typing import List

from odtk import AttrProxy  # type: ignore

import odtk_monte_toolbox.Logging_Tbx as logtbx


def varySRP(
    simulator: AttrProxy,
    satellite: str,
    logFile: logging.Logger,
    loglist: list,
    scaling: float = 1,
):
    """Sets SRP to be varied and optionally defines the scaling value

    Args:
        simulator (AttrProxy): handle on the simulator object
        satellite (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        scaling (float, optional): scaling value for SRP. Defaults to 1.
    """
    simulator.ErrorModeling.DeviateSolarP = True
    simulator.ErrorScaling.SolarP = scaling
    # EstimateSRP must be set to true
    satellite.ForceModel.SolarPressure.EstimateSRP = True

    logtbx.log(logFile, f"SRP Deviation Enabled: Scaling - {scaling}", loglist)


def varyBCoeff(
    simulator: AttrProxy,
    satellite: AttrProxy,
    logFile: logging.Logger,
    loglist: list,
    scaling: float = 1,
):
    """Sets ballistic coefficient to be varied and optionally defines the scaling value

    Args:
        simulator (AttrProxy): handle on the simulator object
        satellite (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        scaling (float, optional): scaling value for BCoeff. Defaults to 1.
    """
    simulator.ErrorModeling.DeviateBCoeff = True
    simulator.ErrorScaling.BCoeff = scaling
    # EstimateBCoeff must be set to true
    satellite.ForceModel.Drag.EstimateBallisticCoeff = True

    logtbx.log(logFile, f"BCoeff Deviation Enabled: Scaling - {scaling}", loglist)


def varyMeasBias(
    simulator: AttrProxy,
    facilities: List[AttrProxy],
    logFile: logging.Logger,
    loglist: list,
    scaling: float = 1,
):
    """Sets measurement biases to be varied and optionally defines the scaling value

    Args:
        simulator (AttrProxy): handle on the simulator object
        facilities (List[AttrProxy]): handles of the facility(s)
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        scaling (float, optional): scaling value for the measurement biases.
        Defaults to 1.
    """
    simulator.ErrorModeling.DeviateMeasBiases = True
    simulator.ErrorScaling.MeasBiases = scaling
    # Each facility must have estimate bias set to true for each measurement type
    for facility in facilities:
        numMeas = facility.MeasurementStatistics.size.eval()
        for i in range(numMeas):
            facility.MeasurementStatistics[i].Type.EstimateBias = True

    logtbx.log(logFile, f"MeasBiases Deviation Enabled: Scaling - {scaling}", loglist)


def varyTropoBias(
    simulator: AttrProxy,
    facilities: List[AttrProxy],
    logFile: logging.Logger,
    loglist: list,
    scaling: float = 1,
):
    """Sets tropo bias to be varied and optionally defines the scaling value

    Args:
        simulator (AttrProxy): handle on the simulator object
        facilities (List[AttrProxy]): handles of the facility(s)
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        scaling (float, optional): scaling value for the tropo biases.
        Defaults to 1.
    """
    simulator.ErrorModeling.DeviateTropoBiases = True
    simulator.ErrorScaling.TropoBiases = scaling
    # Each facility must have tropo bias estimates set to true
    for facility in facilities:
        facility.TroposphereModel.EstimateBias = True

        logtbx.log(
            logFile,
            f"{facility.name.value.eval()} TropoBias Deviation Enabled: "
            f"Scaling - {scaling}",
            loglist,
        )


def drawCrAM(satellite: AttrProxy, logFile: logging.Logger, loglist: list) -> dict:
    """compute new CrAM value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
    Returns:
        dict: dictionary containing drawn CrAM values and associated data
    """
    # Compute new CrAM
    defaultCrAM = satellite.ForceModel.SolarPressure.Model.CrAoverM.Value.eval()
    cram_model = satellite.ForceModel.SolarPressure.Model.CrModel
    shortMu = cram_model.ShortTerm.InitialEstimate.Value.eval()
    shortSigma = cram_model.ShortTerm.Sigma.Value.eval()
    shortDraw = random.gauss(shortMu, shortSigma)
    longMu = cram_model.LongTerm.InitialEstimate.Value.eval()
    longSigma = cram_model.LongTerm.Sigma.Value.eval()
    longDraw = random.gauss(longMu, longSigma)
    newCrAM = defaultCrAM * (1 + longDraw)

    # Ensure new CrAM is not negative
    while newCrAM < 0:

        logtbx.log(
            logFile,
            f"CrAM: ERROR below zero value drawn - {newCrAM}... redrawing",
            loglist,
        )
        shortDraw = random.gauss(shortMu, shortSigma)
        longDraw = random.gauss(longMu, longSigma)
        newCrAM = defaultCrAM * (1 + longDraw)
    # Assign new CrAM
    satellite.ForceModel.SolarPressure.Model.CrAoverM = newCrAM
    cram_model.ShortTerm.InitialEstimate = shortDraw

    logtbx.log(
        logFile,
        f"CrAM : default - {defaultCrAM} "
        f"long sigma - {longSigma} "
        f"long draw - {longDraw}"
        f"new CrAM - {newCrAM}"
        f"short sigma - {shortSigma} "
        f"short initial estimate - {shortDraw} "
        f"draw - {newCrAM}",
        loglist,
    )

    outDict = {
        f"CrAM Default": defaultCrAM,
        f"CrAM Long Sigma": longSigma,
        f"CrAM Draw": newCrAM,
        f"CrAM Short Sigma": shortSigma,
        f"CrAM Short Initial Estimate": shortDraw,
    }

    return outDict


def drawCrAMLongSigma(
    satellite: AttrProxy, logFile: logging.Logger, loglist: list, relSigma: float
) -> dict:
    """compute new CrAM long sigma value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        relSigma (float): percentage to vary by
    Returns:
        dict: dictionary containing drawn CrAM long sigma values and associated data
    """
    # Compute new CrAM Sigma
    cram_model = satellite.ForceModel.SolarPressure.Model.CrModel
    longSigma = cram_model.LongTerm.Sigma.Value.eval()
    newCrAMLongSigma = random.gauss(longSigma, (relSigma * longSigma))

    # Ensure new CrAM is not negative
    while newCrAMLongSigma < 0:

        logtbx.log(
            logFile,
            f"CrAM Long Sigma: ERROR below zero value drawn - {newCrAMLongSigma}... redrawing",
            loglist,
        )

    # Assign new CrAM
    satellite.ForceModel.SolarPressure.Model.CrModel.LongTerm.Sigma = newCrAMLongSigma

    logtbx.log(
        logFile,
        f"CrAM Long Sigma : default - {longSigma} "
        f"Percent Draw - {relSigma} "
        f"Draw - {newCrAMLongSigma} ",
        loglist,
    )

    outDict = {
        f"CrAM Long Sigma Default": longSigma,
        f"CrAM Long Sigma Pct Draw": relSigma,
        f"CrAM Long Sigma Draw": newCrAMLongSigma,
    }

    return outDict


def drawCrAMShortSigma(
    satellite: AttrProxy, logFile: logging.Logger, loglist: list, relSigma: float
) -> dict:
    """compute new CrAM long sigma value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        relSigma (float): percentage to vary by
    Returns:
        dict: dictionary containing drawn CrAM short sigma values and associated data
    """
    # Compute new CrAM Sigma
    cram_model = satellite.ForceModel.SolarPressure.Model.CrModel
    shortSigma = cram_model.ShortTerm.Sigma.Value.eval()
    newCrAMShortSigma = random.gauss(shortSigma, (relSigma * shortSigma))

    # Ensure new CrAM short sigma is not negative
    while newCrAMShortSigma < 0:

        logtbx.log(
            logFile,
            f"CrAM Short Sigma: ERROR below zero value drawn - {newCrAMShortSigma}... redrawing",
            loglist,
        )

    # Assign new CrAM
    satellite.ForceModel.SolarPressure.Model.CrModel.ShortTerm.Sigma = newCrAMShortSigma

    logtbx.log(
        logFile,
        f"CrAM Short Sigma : default - {shortSigma} "
        f"Percent Draw - {relSigma} "
        f"Draw - {newCrAMShortSigma} ",
        loglist,
    )

    outDict = {
        f"CrAM Short Sigma Default": shortSigma,
        f"CrAM Short Sigma Pct Draw": relSigma,
        f"CrAM Short Sigma Draw": newCrAMShortSigma,
    }

    return outDict


def drawCrAMHalfLife(
    satellite: AttrProxy, logFile: logging.Logger, loglist: list, relSigma: float
) -> dict:
    """compute new CrAM half life value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        relSigma (float): percentage to vary by
    Returns:
        dict: dictionary containing drawn CrAM half life values and associated data
    """
    # Compute new CrAM Half Life
    cram_model = satellite.ForceModel.SolarPressure.Model.CrModel
    # TODO: Fix this line
    halflife = cram_model.ShortTerm.HalfLife.GetIn("min")
    newCrAMhalflife = round(random.gauss(halflife, (relSigma * halflife)), 0)

    # Ensure new CrAM half life is not negative
    while newCrAMhalflife < 0:

        logtbx.log(
            logFile,
            f"CrAM Half Life: ERROR below zero value drawn - {newCrAMhalflife}... redrawing",
            loglist,
        )

    # Assign new CrAM
    satellite.ForceModel.SolarPressure.Model.CrModel.ShortTerm.HalfLife.set(
        newCrAMhalflife, "min"
    )

    logtbx.log(
        logFile,
        f"CrAM Half Life : default - {halflife} "
        f"Percent Draw - {relSigma} "
        f"Draw - {newCrAMhalflife} ",
        loglist,
    )

    outDict = {
        f"CrAM Half Life Default": halflife,
        f"CrAM Half Life Pct Draw": relSigma,
        f"CrAM Half Life Draw": newCrAMhalflife,
    }

    return outDict


def drawBCoeff(satellite: AttrProxy, logFile: logging.Logger, loglist: list) -> dict:
    """compute new BCoeff value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
    Returns:
        dict: dictionary containing drawn BCoeff values and associated data
    """
    # Compute New BCoeff
    defaultBc = satellite.ForceModel.Drag.Model.BallisticCoeff.Value.eval()
    bcoeff_model = satellite.ForceModel.Drag.Model.BallisticCoeffModel
    shortMu = bcoeff_model.ShortTerm.InitialEstimate.Value.eval()
    shortSigma = bcoeff_model.ShortTerm.Sigma.Value.eval()
    shortDraw = random.gauss(shortMu, shortSigma)
    longMu = bcoeff_model.LongTerm.InitialEstimate.Value.eval()
    longSigma = bcoeff_model.LongTerm.Sigma.Value.eval()
    longDraw = random.gauss(longMu, longSigma)
    newBc = defaultBc * (1 + longDraw)

    # Ensure new BCoeff is not negative
    while newBc < 0:

        logtbx.log(
            logFile,
            f"BCoeff: ERROR below zero value drawn - {newBc}... redrawing",
            loglist,
        )
        shortDraw = random.gauss(shortMu, shortSigma)
        longDraw = random.gauss(longMu, longSigma)
        newBc = defaultBc * (1 + longDraw)
    # Assign new BCoeff
    satellite.ForceModel.Drag.Model.BallisticCoeff = newBc
    bcoeff_model.ShortTerm.InitialEstimate = shortDraw

    logtbx.log(
        logFile,
        f"BCoeff : default - {defaultBc} "
        f"long sigma - {longSigma} "
        f"long draw - {longDraw} "
        f"new BCoeff - {newBc} "
        f"short sigma - {shortSigma} "
        f"short initial estimate - {shortDraw} ",
        loglist,
    )

    outDict = {
        f"BCoeff Default": defaultBc,
        f"BCoeff Long Sigma": longSigma,
        f"BCoeff Draw": newBc,
        f"BCoeff Short Sigma": shortSigma,
        f"BCoeff Short Initial Estimate": shortDraw,
    }

    return outDict


def drawBCoeffLongSigma(
    satellite: AttrProxy, logFile: logging.Logger, loglist: list, relSigma: float
) -> dict:
    """compute new BCoeff long sigma value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        relSigma (float): percentage to vary by
    Returns:
        dict: dictionary containing drawn BCoeff long sigma values and associated data
    """
    # Compute new BCoeff Long Sigma
    bcoeff_model = satellite.ForceModel.Drag.Model.BallisticCoeffModel
    longSigma = bcoeff_model.LongTerm.Sigma.Value.eval()
    newBCoeffLongSigma = random.gauss(longSigma, (relSigma * longSigma))

    # Ensure new BCoeff sigma is not negative
    while newBCoeffLongSigma < 0:

        logtbx.log(
            logFile,
            f"BCoeff Long Sigma: ERROR below zero value drawn - {newBCoeffLongSigma}... redrawing",
            loglist,
        )

    # Assign new BCoeff long sigma
    satellite.ForceModel.Drag.Model.BallisticCoeffModel.LongTerm.Sigma = (
        newBCoeffLongSigma
    )

    logtbx.log(
        logFile,
        f"BCoeff Long Sigma : default - {longSigma} "
        f"Percent Draw - {relSigma} "
        f"Draw - {newBCoeffLongSigma} ",
        loglist,
    )

    outDict = {
        f"BCoeff Long Sigma Default": longSigma,
        f"BCoeff Long Sigma Pct Draw": relSigma,
        f"BCoeff Long Sigma Draw": newBCoeffLongSigma,
    }

    return outDict


def drawBCoeffShortSigma(
    satellite: AttrProxy, logFile: logging.Logger, loglist: list, relSigma: float
) -> dict:
    """compute new BCoeff short sigma value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        relSigma (float): percentage to vary by
    Returns:
        dict: dictionary containing drawn BCoeff short sigma values and associated data
    """
    # Compute new BCoeff Long Sigma
    bcoeff_model = satellite.ForceModel.Drag.Model.BallisticCoeffModel
    shortSigma = bcoeff_model.ShortTerm.Sigma.Value.eval()
    newBCoeffShortSigma = random.gauss(shortSigma, (relSigma * shortSigma))

    # Ensure new BCoeff sigma is not negative
    while newBCoeffShortSigma < 0:

        logtbx.log(
            logFile,
            f"BCoeff Short Sigma: ERROR below zero value drawn - {newBCoeffShortSigma}... redrawing",
            loglist,
        )

    # Assign new BCoeff short sigma
    satellite.ForceModel.Drag.Model.BallisticCoeffModel.ShortTerm.Sigma = (
        newBCoeffShortSigma
    )

    logtbx.log(
        logFile,
        f"BCoeff Short Sigma : default - {shortSigma} "
        f"Percent Draw - {relSigma} "
        f"Draw - {newBCoeffShortSigma} ",
        loglist,
    )

    outDict = {
        f"BCoeff Short Sigma Default": shortSigma,
        f"BCoeff Short Sigma Pct Draw": relSigma,
        f"BCoeff Short Sigma Draw": newBCoeffShortSigma,
    }

    return outDict


def drawBCoeffHalfLife(
    satellite: AttrProxy, logFile: logging.Logger, loglist: list, relSigma: float
) -> dict:
    """compute new BCoeff half life value and assign it to the satellite

    Args:
        satName (AttrProxy): handle on the satellite object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
        relSigma (float): percentage to vary by
    Returns:
        dict: dictionary containing drawn BCoeff half life values and associated data
    """
    # Compute new BCoeff Half Life
    bcoeff_model = satellite.ForceModel.Drag.Model.BallisticCoeffModel
    # TODO: Fix this line
    halflife = bcoeff_model.ShortTerm.HalfLife.GetIn("min")
    newBCoeffhalflife = round(random.gauss(halflife, (relSigma * halflife)), 0)

    # Ensure new BCoeff half life is not negative
    while newBCoeffhalflife < 0:

        logtbx.log(
            logFile,
            f"BCoeff Half Life: ERROR below zero value drawn - {newBCoeffhalflife}... redrawing",
            loglist,
        )

    # Assign new BCoeff half life
    satellite.ForceModel.Drag.Model.BallisticCoeffModel.ShortTerm.HalfLife.set(
        newBCoeffhalflife, "min"
    )

    logtbx.log(
        logFile,
        f"BCoeff Half Life : default - {halflife} "
        f"Percent Draw - {relSigma} "
        f"Draw - {newBCoeffhalflife} ",
        loglist,
    )

    outDict = {
        f"BCoeff Half Life Default": halflife,
        f"BCoeff Half Life Pct Draw": relSigma,
        f"BCoeff Half Life Draw": newBCoeffhalflife,
    }

    return outDict


def drawMeasBias(
    facilities: List[AttrProxy], logFile: logging.Logger, loglist: list
) -> dict:
    """compute new measurement bias value and assign it to the satellite

    Args:
        facNames (List[AttrProxy]): handles of the facility(s)
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
    Returns:
        dict: dictionary containing drawn measurement bias values and associated data
    """
    outDict = {}
    for facility in facilities:
        numMeas = facility.MeasurementStatistics.size.eval()
        facName = facility.Name.Value.eval()
        for i in range(numMeas):
            measName = facility.MeasurementStatistics[i].Name.Value.eval()
            bias_model = facility.MeasurementStatistics[i].Type.BiasModel

            # Draw new bias
            LongBiasUnit = bias_model.LongTerm.Constant.unit.eval()
            LongBias = bias_model.LongTerm.Constant.GetIn(LongBiasUnit)
            LongSigmaUnit = bias_model.LongTerm.Sigma.unit.eval()
            LongSigma = bias_model.LongTerm.Sigma.GetIn(LongSigmaUnit)
            newLongBias = random.gauss(LongBias, LongSigma)

            ShortEstimateUnit = bias_model.ShortTerm.InitialEstimate.unit.eval()
            ShortEstimate = bias_model.ShortTerm.InitialEstimate.GetIn(ShortEstimateUnit)
            ShortSigmaUnit = bias_model.ShortTerm.Sigma.unit.eval()
            ShortSigma = bias_model.ShortTerm.Sigma.GetIn(ShortSigmaUnit)
            newShortEstimate = random.gauss(ShortEstimate,ShortSigma)

            # Assign new biases
            bias_model.LongTerm.Constant.Set(newLongBias, LongBiasUnit)
            bias_model.ShortTerm.InitialEstimate.Set(newShortEstimate,ShortEstimateUnit)

            logtbx.log(
                logFile,
                f"Measurement Bias: Facility - {facility.Name.eval()} "
                f"Measurement - {measName} "
                f"Initial Bias - {LongBias} "
                f"Long Sigma - {LongSigma} "
                f"New Bias - {newLongBias}"
                f"Short Sigma - {ShortSigma}"
                f"Short Initial Estimate - {newShortEstimate}",
                loglist,
            )
            # Save to output data frame
            outDict.update(
                {
                    f"{facName} {measName} Default Bias": LongBias,
                    f"{facName} {measName} Long Sigma": LongSigma,
                    f"{facName} {measName} New Bias": newLongBias,
                    f"{facName} {measName} Short Sigma": ShortSigma,  
                    f"{facName} {measName} Short Initial Estimate": newShortEstimate,                  
                    f"{facName} {measName} Unit": LongBiasUnit,
                }
            )

    return outDict


def singleTruthResetDraws(
    facilities: List[AttrProxy],
    logFile: logging.Logger,
    loglist: list,
):
    """reset the varied values of any non-template objects

    Args:
        facilities (List[AttrProxy]): handles of the facility(s)
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
    """

    for facility in facilities:
        numMeas = facility.MeasurementStatistics.size.eval()
        for i in range(numMeas):
            facility.MeasurementStatistics[i].Type.BiasModel.ShortTerm.InitialEstimate = 0
            facility.MeasurementStatistics[i].Type.BiasModel.LongTerm.Constant = 0

    logtbx.log(logFile, "Reset all varied values to nominal", loglist)


def assignRandomSeed(simulator: AttrProxy, logFile: logging.Logger, loglist: list):
    """generate a random seed value and assign that to the simulator

    Args:
        simulator (AttrProxy): handle on the simulator object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
    """
    seed = random.randint(1, 2147483647)
    simulator.ErrorModeling.RandomSeed = seed

    logtbx.log(logFile, f"Simulator random seed set to {seed}", loglist)


def setNoDeviations(simulator: AttrProxy, logFile: logging.Logger, loglist: list):
    """Set all deviations within the simulator to False, better than using NoDeviations
    because these will be turned on one at a time

    Args:
        simulator (AttrProxy): handle on the simulator object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
    """
    em = simulator.ErrorModeling
    em.NoDeviations = False
    em.DeviateOrbits = False
    em.DeviateDensity = False
    em.DeviateBCoeff = False
    em.DeviateSolarP = False
    em.DeviateTranspDelay = False
    em.DeviateRetroDelay = False
    em.DeviateMeasBiases = False
    em.DeviateTropoBiases = False
    em.DeviateManeuvers = False
    em.AddProcessNoise = False
    em.AddForceModelProcessNoise = False
    em.AddManeuverProcessNoise = False
    em.AddMeasWhiteNoise = False
    em.DeviateSurfaceTrajectories = False
    em.AddSurfaceTrajectoryProcessNoise = False
    em.DeviateStationLocations = False
    em.DeviateAntennaLocations = False
    em.DeviateClocks = False
    em.DeviateMeasTimeBias = False
    em.DeviateAccelerometers = False
    em.DeviateGlobalDensity = False
    em.AddGlobalDensityProcessNoise = False
    em.DeviateEmpiricalForces = False
    em.DeviateCentralBodyOrbits = False
    em.DeviateCentralBodyGravity = False
    em.DeviateChildDeploymentVelocity = False

    logtbx.log(logFile, "All Simulator Deviations Disabled", loglist)


def setSingleTruthDeviations(
    simulator: AttrProxy, logFile: logging.Logger, loglist: list, perturbations: list
):
    """Set all deviations within the simulator for single truth

    Args:
        simulator (AttrProxy): handle on the simulator object
        logFile (logging.Logger): handle of the logger
        loglist (list): a running list for displayed log messages
    """
    em = simulator.ErrorModeling
    em.NoDeviations = False
    em.DeviateOrbits = False
    em.DeviateDensity = False
    em.DeviateBCoeff = False
    em.DeviateSolarP = False
    em.DeviateTranspDelay = False
    em.DeviateRetroDelay = False
    em.DeviateMeasBiases = False
    em.DeviateTropoBiases = False
    em.DeviateManeuvers = False
    em.AddProcessNoise = True
    em.AddForceModelProcessNoise = True
    em.AddManeuverProcessNoise = False
    em.AddMeasWhiteNoise = True
    em.DeviateSurfaceTrajectories = False
    em.AddSurfaceTrajectoryProcessNoise = False
    em.DeviateStationLocations = False
    em.DeviateAntennaLocations = False
    em.DeviateClocks = False
    em.DeviateMeasTimeBias = False
    em.DeviateAccelerometers = False
    em.DeviateGlobalDensity = False
    em.AddGlobalDensityProcessNoise = False
    em.DeviateEmpiricalForces = False
    em.DeviateCentralBodyOrbits = False
    em.DeviateCentralBodyGravity = False
    em.DeviateChildDeploymentVelocity = False

    logtbx.log(
        logFile, "Simulator Deviations Set from setSingleTruthDeviations", loglist
    )
