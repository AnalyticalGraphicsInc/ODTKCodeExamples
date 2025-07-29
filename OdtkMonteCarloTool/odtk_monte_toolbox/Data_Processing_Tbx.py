"""
Functions for reading output data from ODTK and processing it as necessary for use in
the Monte Carlo study.
"""

from functools import wraps
import pickle
import sys
import time
from typing import List, Tuple
from pathlib import Path

from scipy.stats import chi
from statsmodels.distributions.empirical_distribution import ECDF

import odtk_monte_toolbox.Logging_Tbx as ltbx
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import plotly.express as px
import scipy.interpolate as interp
from plotly.graph_objs import Figure
from typing import Any
import math


def timeit(func):
    @wraps(func)
    def timeit_wrapper(*args, **kwargs):
        start_time = time.perf_counter()
        result = func(*args, **kwargs)
        end_time = time.perf_counter()
        total_time = end_time - start_time
        print(f"Function {func.__name__} Took {total_time:.4f} seconds")
        return result

    return timeit_wrapper


def _load_pickle(path: Path) -> Any:

    if path.exists():
        with path.open("rb") as f:
            return pickle.load(f)
    else:
        raise FileNotFoundError(f"File {path} doesn't exist")


def getDrawDf(runDir: Path) -> pd.DataFrame:
    """Load draw data dataframe from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        pd.DataFrame: the perturbation draws stored in a dataframe
    """

    return _load_pickle(runDir / "Post_Processing" / "drawData.pkl")


def getFilepathDf(runDir: Path) -> pd.DataFrame:
    """Load ephemeris locations dataframe from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        pd.DataFrame: the ephemeris locations stored in a dataframe
    """
    return _load_pickle(runDir / "Post_Processing" / "ephemLocations.pkl")


def getFilterPredEphem(runDir: Path) -> dict:
    """Load filter prediction dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter prediction ephemeris stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filPredEphem.pkl")


def getFilterPredSpanDiffs(runDir: Path) -> dict:
    """Load filter prediction span difference dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter prediction span difference ephemeris stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filPredSpanDiffs.pkl")


def getDivergedDict(runDir: Path) -> dict:
    """Load filter diverged dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter divergence status stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filterDiverged.pkl")


def getFilterFitEphem(runDir: Path) -> dict:
    """Load filter fitspan dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter fitspan ephemeris stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filFitEphem.pkl")



def getFilterPredSigRhoCov(runDir: Path) -> dict:
    """Load filter prediction covariance dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter prediction covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filPredCovSigRho.pkl")

def getFilterPredCov(runDir: Path) -> dict:
    """Load filter prediction covariance dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter prediction covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filPredCov.pkl")

def getFilterFitSigRhoCov(runDir: Path) -> dict:
    """Load filter fitspan covariance dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter fitspan covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filFitCovSigRho.pkl")

def getFilterFitCov(runDir: Path) -> dict:
    """Load filter fitspan covariance dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter fitspan covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filFitCov.pkl")

def getFilterPredNumericalCov(runDir: Path) -> dict:
    """Load filter prediction numerical covariance data frame from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter prediction numerical covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filPredNumericalCov.pkl")


def getFilterFitNumericalCov(runDir: Path) -> dict:
    """Load filter fit numerical covariance data frame from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the filter fitspan numerical covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "filFitNumericalCov.pkl")


def getSmootherFitEphem(runDir: Path) -> dict:
    """Load smoother fitspan dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the smoother fitspan ephemeris stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "smoFitEphem.pkl")


def getSmootherFitSigRhoCov(runDir: Path) -> dict:
    """Load smoother fitspan covariance dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the smoother fitspan covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "smoFitCovSigRho.pkl")

def getSmootherFitCov(runDir: Path) -> dict:
    """Load smoother fitspan covariance dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the smoother fitspan covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "smoFitCov.pkl")

def getSmootherFitNumericalCov(runDir: Path) -> dict:
    """Load smoother fit numerical covariance data frame from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the smoother fit numerical covariance stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "smoFitNumericalCov.pkl")


def getTruthEphem(runDir: Path) -> dict:
    """Load truth dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the truth ephemeris stored in a dictionary
    """
    return _load_pickle(runDir / "Post_Processing" / "truthEphem.pkl")

def getSmootherFullRunMahalData(runDir: Path) -> dict:
    """Load mahalanobis distance data from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the mahalanobis data stored in a dataframe
    """
    return _load_pickle(runDir / "Post_Processing" / "smoFullMahal.pkl")

def getFilPredMahalData(runDir: Path) -> dict:
    """Load mahalanobis distance data from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: the mahalanobis data stored in a dataframe
    """
    return _load_pickle(runDir / "Post_Processing" / "filPredMahal.pkl")

def readEphemerisTimePosVel(
    ephemFilepath: str,
    predictStart: float = None,
    isSmoother: bool = False,
) -> Tuple[np.ndarray, np.ndarray, List[str]]:
    """Read output ephemeris

    Args:
        ephemFilepath (str): the path to the ephemeris files
        predictStart (float, optional): time of the predict start. Defaults to None.
        isSmoother (bool, optional): if this is smoother or filter ephemeris.
        Defaults to False

    Returns:
        Tuple[np.ndarray, np.ndarray, List[str]]: a numpy array of times, a numpy array
        of ephemeris points and a list of ephemeris categories as string
    """
    with Path(ephemFilepath).open("r") as ephemFile:
        time_list = []
        data_list = []
        ephem_type_list = []
        while True:
            line = ephemFile.readline()
            if "EphemerisTimePosVel" in line:
                break

        isFirst = True
        while True:
            dataLine = ephemFile.readline()
            # TODO: If CovarianceTimePosVel kick into covariance reading then only call once
            if (
                dataLine.strip() == "END Ephemeris"
                or dataLine.strip() == "CovarianceTimePosVel"
            ):
                break
            if not dataLine.strip() == "":
                tempLine = dataLine.split()
                tempTime = float(tempLine[0])
                tempData = tempLine[1:]

                if isSmoother and isFirst:
                    smootherTimeOffset = tempTime * (-1)
                    isFirst = False

                if isSmoother:
                    if tempTime > 0:
                        time_list.append(tempTime)
                        data_list.append(np.array(tempData, dtype="float64"))
                        ephem_type_list.append("Predict")
                    else:
                        tempTime += smootherTimeOffset
                        time_list.append(tempTime)
                        data_list.append(np.array(tempData, dtype="float64"))
                        ephem_type_list.append("Fit")
                else:
                    if (predictStart) and (tempTime >= predictStart):
                        time_list.append(tempTime)
                        data_list.append(np.array(tempData, dtype="float64"))
                        ephem_type_list.append("Predict")
                    else:
                        time_list.append(tempTime)
                        data_list.append(np.array(tempData, dtype="float64"))
                        ephem_type_list.append("Fit")

        time_numpy = np.stack(time_list)
        data_numpy = np.stack(data_list)
        return (time_numpy, data_numpy, ephem_type_list)


def readCovarianceTimePosVel(
    ephemFilepath: str,
    predictStart: float = None,
    isSmoother: bool = False,
) -> Tuple[np.ndarray, np.ndarray, List[str]]:
    """Read lower triangular covariance from an ephemeris file and returns the full
    covariance as a numpy array of matrices

    Args:
        ephemFilepath (str): path to the ephemeris files
        predictStart (float, optional): time of the predict start. Defaults to None.
        isSmoother (bool, optional): if this is smoother or filter ephemeris.
        Defaults to False.

    Returns:
        Tuple[np.ndarray, np.ndarray, List[str]]: a numpy array of times, a numpy array
        of covariance matrices and a list of ephemeris categories as string
    """

    with Path(ephemFilepath).open("r") as ephemFile:
        time_list = []
        data_list = []
        ephem_type_list = []
        while True:
            line = ephemFile.readline()
            if "CovarianceTimePosVel" in line:
                break

        isFirst = True
        while True:
            dataLine = ephemFile.readline()
            if dataLine.strip() == "END Ephemeris":
                break

            if not dataLine.strip() == "":
                dataLine2 = ephemFile.readline()
                dataLine3 = ephemFile.readline()
                dataLine = dataLine + " " + dataLine2 + " " + dataLine3
                tempLine = dataLine.split()
                tempTime = float(tempLine[0])
                matrix = np.zeros((6, 6), dtype="float64")
                matrix[np.tril_indices_from(matrix, 0)] = np.array(
                    tempLine[1:], dtype="float64"
                )

                if isSmoother and isFirst:
                    smootherTimeOffset = tempTime * (-1)
                    isFirst = False
                if isSmoother:
                    if tempTime > 0:
                        time_list.append(tempTime)
                        data_list.append(matrix)
                        ephem_type_list.append("Predict")
                    else:
                        tempTime += smootherTimeOffset
                        time_list.append(tempTime)
                        data_list.append(matrix)
                        ephem_type_list.append("Fit")
                else:
                    if (predictStart) and (tempTime >= predictStart):
                        time_list.append(tempTime)
                        data_list.append(matrix)
                        ephem_type_list.append("Predict")
                    else:
                        time_list.append(tempTime)
                        data_list.append(matrix)
                        ephem_type_list.append("Fit")

    time_numpy = np.stack(time_list)
    data_numpy = np.stack(data_list)
    data_numpy = data_numpy + np.transpose(np.tril(data_numpy[:], -1), axes=(0, 2, 1))
    return (time_numpy, data_numpy, ephem_type_list)


def convertICRFCovToRIC(ephemeris: np.ndarray, covariance: np.ndarray) -> np.ndarray:
    """Convert 6x6 covariance in inertial frame and in df format to RIC frame of parent
    sat
    * Use covariance matrix, not sig rho or correlation

    Args:
        time (np.ndarray): an array of time values associated with the ephem and cov
        ephemeris (np.ndarray): an array of ephemeris vectors containing pos and vel in
        the ICRF frame
        covariance (np.ndarray): an array of covariance matrices in the ICRF frame

    Returns:
        np.ndarray: an array of covariance matrices rotated into the RIC frame
    """
    r = ephemeris[:, 0:3]
    v = ephemeris[:, 3:6]
    x_hat = r / np.linalg.norm(r, axis=1, keepdims=True)
    z_hat = np.cross(r, v) / np.linalg.norm(np.cross(r, v), axis=1, keepdims=True)
    y_hat = np.cross(z_hat, x_hat) / np.linalg.norm(
        np.cross(z_hat, x_hat), axis=1, keepdims=True
    )

    dcm = np.zeros_like(covariance)

    dcm[:, 0, 0:3] = dcm[:, 3, 3:6] = x_hat
    dcm[:, 1, 0:3] = dcm[:, 4, 3:6] = y_hat
    dcm[:, 2, 0:3] = dcm[:, 5, 3:6] = z_hat

    rotated_covariance = dcm @ covariance @ np.transpose(dcm, axes=(0, 2, 1))
    return rotated_covariance


def convertCovToSigRho(covariance: np.ndarray) -> np.ndarray:
    """Convert 6x6 covariance in RIC frame to sigma rho format

    Args:
        covariance (np.ndarray): an array of covariance matrices in the RIC frame

    Returns:
        np.ndarray: an array of covariance matrices in the sigma rho format
    """
    covariance_diags = np.diagonal(covariance, axis1=1, axis2=2)
    ident = np.zeros_like(covariance) + np.identity(6)
    dinv = (1 / np.sqrt(covariance_diags)).reshape((ident.shape[0], ident.shape[1], 1))
    diags = ident * dinv
    sig_rho_matrix = (
        (diags @ covariance @ diags)
        - ident
        + (
            ident
            * np.sqrt(covariance_diags).reshape((ident.shape[0], ident.shape[1], 1))
        )
    )

    return sig_rho_matrix


def computeNumericalCovariance(ephem: dict, diverged: dict, sigrho: bool = False) -> dict:
    """Compute numerical covariance from set of ephemeris files and outputs the SigRho
    covariance in RIC

    Args:
        ephem (dict): Dictionary of ephemeris files
        diverged (dict): Dictionary of whether or not trial diverged

    Returns:
        dict: a dictionary with each key representing a trial and the values having a
        tuple of time array and numerical covariance np.ndarray
    """
    ephem_list = []
    num_cov_list = []

    for trial, value in ephem.items():
        if diverged[trial] == 'Converged':
            unique_times, unique_index = np.unique(value[0], return_index=True)
            ephem_list.append(value[1][unique_index])
        else:
            print(f'Numerical Covariance - Skipping Diverged Trial {trial}')

    ephem_numpy = np.stack(ephem_list)

    for i in range(0, ephem_numpy.shape[1]):
        num_cov_list.append(np.cov(ephem_numpy[:, i, :], rowvar=False))

    numerical_covariance = np.stack(num_cov_list)

    numerical_covariance_dict = {}
    # Loop through and convert to sig rho in RIC
    for key, value in ephem.items():
        numerical_covariance_dict[key] = (
            unique_times,
            convertCovToSigRho(convertICRFCovToRIC(value[1], numerical_covariance)),
        )

    return numerical_covariance_dict


def plotMahalanobisDistance(runDir: Path, showPlot: bool = False) -> Figure:
    """Plots Mahalanobis distance for each trial over time relative to truth
    ephem using smoother ephem.

    Args:
        runDir (Path): the folder for this run
        showPlot (bool): boolean for displaying plotly plot

    Returns:
        mahalFigure (Figure): plotly express line plot of mahalanabis distance
    """

    mahalData = getSmootherFullRunMahalData(runDir)

    ylabels = list(mahalData.columns)
    del ylabels[0]

    mahalFigure = px.line(
        mahalData, x="Time", y=ylabels, title="Smoother Full Run Mahalanobis Distance vs Trial"
    )
    mahalFigure.update_layout(
        yaxis_title="Mahalanobis Distance", legend_title_text="Trial #"
    )

    if showPlot:
        mahalFigure.show()
    else:
        return mahalFigure


def plotPositionError(runDir: Path, showPlot: bool = False) -> Figure:
    """Plots position error for each trial over time relative to truth
    ephem using smoother ephem.

    Args:
        runDir (Path): the folder for this run
        showPlot (bool): boolean for displaying plotly plot

    Returns:
        positionFigure (Figure): plotly express line plot of position error
    """
    ephemDf = getFilepathDf(runDir)
    divergedDict = getDivergedDict(runDir)
    fullDf = ephemDf[ephemDf["spanNum"] == "OD_FullRun"].set_index("trialNum")

    truthtimes, _, _ = readEphemerisTimePosVel(fullDf["truthPath"].iloc[0])
    posData = pd.DataFrame(truthtimes, columns=["Time"])

    for trial in range(len(fullDf)):
        _, truthpos, _ = readEphemerisTimePosVel(fullDf["truthPath"].iloc[trial])
        _, pos, _ = readEphemerisTimePosVel(fullDf["smoothPath"].iloc[trial])

        delta = truthpos - pos

        lab = f"Trial {trial+1}"
        posData[lab] = np.linalg.norm(delta, axis=1)
        if divergedDict[trial+1] == 'Diverged':
            posData[lab] *= 0

    ylabels = list(posData.columns)
    del ylabels[0]

    positionFigure = px.line(
        posData, x="Time", y=ylabels, title="Position Error vs Trial"
    )
    positionFigure.update_layout(
        yaxis_title="Position Error [m]", legend_title_text="Trial #"
    )

    if showPlot:
        positionFigure.show()
    else:
        return positionFigure


def plotMeanCovariance(
    runDir: Path,
    covType: str = "Filter Predict",
    showPlot: bool = False,
) -> Figure:
    """Plots mean covariance from ODTK across all trials for input covariance type.

    Args:
        runDir (Path): the folder for this run
        covType (str): valid values are 'Filter Predict', 'Filter Fit', and
        'Smoother Fit'
        isNumerical (bool): covariance computation is numerical?
        showPlot (bool): boolean for displaying plotly plot

    Returns:
        mahalFigure (Figure): plotly express line plot of mahalanabis distance
    """
    # Gather data
    if covType == "Filter Predict":
        numcov = getFilterPredNumericalCov(runDir)
        cov = getFilterPredSigRhoCov(runDir)
    elif covType == "Filter Fit":
        numcov = getFilterFitNumericalCov(runDir)
        cov = getFilterFitSigRhoCov(runDir)
    elif covType == "Smoother Fit":
        numcov = getSmootherFitNumericalCov(runDir)
        cov = getSmootherFitSigRhoCov(runDir)
    else:
        sys.exit("covType flag set to incorrect value")

    #### Mean Covariance Plot ###
    covs = []
    numcovs = []
    times = []
    numtimes = []
    divergedDict = getDivergedDict(runDir)

    # Build data structures by stacking times and covariance
    for trial in cov.keys():
        if divergedDict[trial] == 'Converged':
            times.append(cov[trial][0])
            covs.append(cov[trial][1])
            numtimes.append(numcov[trial][0])
            numcovs.append(numcov[trial][1])
        else:
            print(f'Excluded diverged trial {trial}')

    columns = [
        "Time",
        "X Sigma",
        "XY Corr",
        "XZ Corr",
        "XvX Corr",
        "XvY Corr",
        "XvZ Corr",
        "YX Corr",
        "Y Sigma",
        "YZ Corr",
        "YvX Corr",
        "YvY Corr",
        "YvZ Corr",
        "ZX Corr",
        "ZY Corr",
        "Z Sigma",
        "ZvX Corr",
        "ZvY Corr",
        "ZvZ Corr",
        "vXX Corr",
        "vXY Corr",
        "vXZ Corr",
        "vX Sigma",
        "vXvY Corr",
        "vXvZ Corr",
        "vYX Corr",
        "vYY Corr",
        "vYZ Corr",
        "vYvX Corr",
        "vY Sigma",
        "vYvZ Corr",
        "vZX Corr",
        "vZY Corr",
        "vZZ Corr",
        "vZvX Corr",
        "vZvY Corr",
        "vZ Sigma",
    ]

    # Build singular numpy arrays with all data, time is first column
    times = np.hstack(times)
    times = times.reshape(times.shape[0], 1)
    covs = np.vstack(covs)
    covs = covs.reshape(covs.shape[0], covs.shape[1] * covs.shape[2])
    timecov = pd.DataFrame(np.hstack([times, covs]), columns=columns)

    timecovmean = timecov.groupby(timecov.Time).agg("mean")

    numtimes = np.hstack(numtimes)
    numtimes = numtimes.reshape(numtimes.shape[0], 1)
    numcovs = np.vstack(numcovs)
    numcovs = numcovs.reshape(numcovs.shape[0], numcovs.shape[1] * numcovs.shape[2])
    numtimecov = pd.DataFrame(np.hstack([numtimes, numcovs]), columns=columns)

    numtimecovmean = numtimecov.groupby(numtimecov.Time).agg("mean")

    # Compute delta
    deltaDf = timecovmean.subtract(numtimecovmean)

    # Plot mean sigmas
    ylabels = ["X Sigma", "Y Sigma", "Z Sigma"]

    # Compute Maximum
    ymax = round(max(timecovmean[ylabels].max().max(),numtimecovmean[ylabels].max().max()) * 1.05)

    num_title_string = f"{covType} Numerical Covariance Sigmas [RIC]"

    title_string = f"{covType} ODTK Covariance Sigmas [RIC]"

    delta_title_string = f'{covType} Delta Covariance Sigmas [RIC]'

    covFigure = px.line(timecovmean, x=timecovmean.index, y=ylabels, title=title_string)
    covFigure.update_layout(
        yaxis_title="Position Covariance [m]", legend_title_text="State"
    )
    covFigure.update_yaxes(range = [0,ymax])

    numcovFigure = px.line(numtimecovmean, x=numtimecovmean.index, y=ylabels, title=num_title_string)
    numcovFigure.update_layout(
        yaxis_title="Position Covariance [m]", legend_title_text="State"
    )
    numcovFigure.update_yaxes(range = [0,ymax])

    deltaFigure = px.line(deltaDf, x=deltaDf.index, y=ylabels, title=delta_title_string)
    deltaFigure.update_layout(
        yaxis_title="Position Covariance [m]", legend_title_text="State"
    )

    if showPlot:
        covFigure.show()
        numcovFigure.show()
        deltaFigure.show()
    else:
        return covFigure, numcovFigure, deltaFigure


def plotDistanceCDF(
    runDir: Path,
    diffType: str = "Filter Predict",
    diffElement: str = "pos_diff",
    plotType: str = "plotly",
    showPlot: bool = False,
    levels: list = None
) -> Figure:
    """Plots probability density function

    Args:
        runDir (Path): the folder for this run
        levels (list): list of times to plot at in hours
        diffType (str): valid values are 'Filter Predict', 'Filter Fit',
        'Smoother Fit', and 'Mahal'
        diffElement (str): valid values are 'pos_diff', 'vel_diff', 
        'XDiff','YDiff','ZDiff','VxDiff','VyDiff','VzDiff'
        plotType (str): valid values are "matplot" and "plotly"
        showPlot (bool): boolean for displaying plotly plot

    Returns:
        pdfFigure (Figure): plotly express line plot of cdf
    """

    metaDict = ltbx.getMetaDictionary(runDir)
    divergedDict = getDivergedDict(runDir)

    # Gather data
    if diffType == "Mahal":
        diff = getFilPredMahalData(runDir)
        trials = diff['trials']
        times = diff['times']
        mahaldist = diff['mahal']

        columns = ['trial','time','mahaldist']
        df = pd.DataFrame(np.vstack([trials,times,mahaldist]).T, columns=columns)
        df['trial'] = df['trial'].astype(int)

        # divergedIndices = [k for k,v in divergedDict.items() if v == 'Diverged']
        # df = df[~df['trial'].isin(divergedIndices)]

    else:
        if diffType == "Filter Predict":
            diff = getFilterPredSpanDiffs(runDir)
        elif diffType == "Filter Fit":
            diff = getFilterFitSigRhoCov(runDir)
        elif diffType == "Smoother Fit":
            diff = getSmootherFitSigRhoCov(runDir)
        else:
            sys.exit("diffType flag set to incorrect value")
        
        columns = ['trial','time','XDiff','YDiff','ZDiff','VxDiff','VyDiff','VzDiff']
        times = diff['times']
        diffs = diff['diffs']
        trials = diff['trials']
        df = pd.DataFrame(np.hstack([trials.reshape(trials.shape[0],1),times.reshape(times.shape[0],1),diffs]), columns=columns)
        df['trial'] = df['trial'].astype(int)

        divergedIndices = [k for k,v in divergedDict.items() if v == 'Diverged']
        df = df[~df['trial'].isin(divergedIndices)]

        df['pos_diff'] = (df.XDiff ** 2 + df.YDiff ** 2 + df.ZDiff ** 2) ** (1/2)
        df['vel_diff'] = (df.VxDiff ** 2 + df.VyDiff ** 2 + df.VzDiff ** 2) ** (1/2)
        
    # Plot the emperical CDF
    # Generate results at the 1, 2, and 3-sigma values.
    sigmas = np.array([1, 2, 3])
    pct = chi.cdf(sigmas, df=1)
    diffs_array = []
    cdf_max = 0
    cdf_min = 1e10

    if plotType == 'matplot':
        fig, ax = plt.subplots()
    elif plotType == 'plotly':
        ylabels = []

    if levels is None:
        levels = [1]
        levels.extend(list(range(5,5 * math.floor(metaDict['pred_dur_sec'] / 60 / 60 / 5) + 1,5)))
        levels.append(math.floor(metaDict['pred_dur_sec'] / 60 / 60))

    for hour in levels:

        pos_diffs = df[df.time == hour * 3600][diffElement]

        if not pos_diffs.empty:
            # Build the CDF and get values at the desired percentages.
            ecdf = ECDF(abs(pos_diffs))
            key_points = np.interp(pct, ecdf.y, ecdf.x)
            cdf_max = max(cdf_max, ecdf.x[-1])
            cdf_min = min(cdf_min,ecdf.x[1])
            diffs_array.append(key_points)

            if plotType == 'matplot':
                ax.plot(ecdf.y[1:] * 100, ecdf.x[1:], '-', alpha=0.5)
                ax.scatter(pct * 100, key_points, marker='o', c='grey', s=6)
                # Annotate the key points.
                for p, k in zip(pct, key_points):

                    # Try to declutter the numbers.
                    alignment = 'right'
                    xoffset = -5
                    if p == pct[-1]:
                        alignment = 'left'
                        xoffset = 5

                    ax.annotate(f'{k:.0f}', xy=(p * 100, k), textcoords='offset points', xytext=(xoffset, 5),
                                horizontalalignment=alignment)

                # Annotate the lines
                ax.annotate(f'{hour:2d} hrs', xy=(100, ecdf.x[-1]), textcoords='offset points', xytext=(30, 0),
                            fontweight='bold')
            elif plotType == 'plotly':
                if hour == levels[0]:
                    data = pd.DataFrame()
                    data['X'] = ecdf.y[1:]
                    data[f'{hour} Hour'] = ecdf.x[1:]
                else:
                    data[f'{hour} Hour'] = ecdf.x[1:]

                ylabels.append(f'{hour} Hour')
        else:
            print(f"No position differences available for hour {hour}.")
            diffs_array.append(np.zeros_like(pct))

        print(f"Done with hour {hour}.")

    if plotType == 'matplot':
        # Draw sigma lines
        max_diffs = np.array(diffs_array).max(axis=0)
        for p, s, d in zip(pct * 100, sigmas, max_diffs):
            ax.vlines(p, ymin=0, ymax=d, linestyle='--', linewidth=0.5, color='k', alpha=0.1)
            ax.annotate(fr'{s}$\sigma$', xy=(p, -2), textcoords='offset points', xytext=(0, -10),
                        horizontalalignment='center', verticalalignment='center')
        ax.set_xlim(xmin=0, xmax=105)

        # Try to set a consistent limit if it would be meaningful.
        ax.set_ylim(ymin=cdf_min, ymax=cdf_max)
        ax.set_xlabel('Percent', fontweight='bold')
        ax.set_ylabel('Position Difference [m]',  fontweight='bold')
        fig.suptitle('Prediction Accuracy CDF\n', fontweight='bold')
        fig.tight_layout()
        if showPlot:
            plt.show()
        else:
            return plt
         
    elif plotType == 'plotly':
        if diffElement == 'pos_diff':
            plotTitle = f'Cumulative Density Function at Time into Predict: {diffType} -- {diffElement}'
            yax = 'Position Error [m]'
        elif diffElement == 'vel_diff':
            plotTitle = f'Cumulative Density Function at Time into Predict: {diffType} -- {diffElement}'
            yax = 'Velocity Error [m/s]'
        elif diffElement == 'mahaldist':
            plotTitle = f'Cumulative Density Function of Filter Predict Mahalanobis Distance'
            yax = 'Mahalanobis Distance'
        else:
            plotTitle = f'Cumulative Density Function at Time into Predict: {diffType} -- {diffElement}'
            yax = 'Metric'
        cdfFigure = px.line(data, x=data.X, y=ylabels, title=plotTitle)
        cdfFigure.update_layout(
            yaxis_title=yax, legend_title_text="Time into Predict"
        )
        if showPlot:
            cdfFigure.show()
        else:
            return cdfFigure
    

### NOT CURRENTLY USED ###
def runHermitianFirstOrder(timePosVelDF: pd.DataFrame):
    """Run hermitian interpolator using position and velocity - removes double points
    This will only be needed when two filter ephemeris files don't have the same time
    step, but since we're simulating obs at the same time (currently) this isn't needed,
    everything at the same time step

    Args:
        timePosVelDF (pd.DataFrame): data frame containing the ephemeris (time-pos-vel)

    Returns:
        pd.DataFrame: data frame containing the ephemeris but interpolated
        (time-pos-vel)
    """
    time = timePosVelDF["Time"].to_list()
    xPos = timePosVelDF["X Pos"].to_list()
    # yPos = timePosVelDF["Y Pos"].to_list()
    # zPos = timePosVelDF["Z Pos"].to_list()
    xVel = timePosVelDF["X Vel"].to_list()
    # yVel = timePosVelDF["Y Vel"].to_list()
    # zVel = timePosVelDF["Z Vel"].to_list()
    hermiteDF = interp.CubicHermiteSpline(time, xPos, xVel)
    return hermiteDF


def differencePosVelICRFSameStep(
    ephemOneData: pd.DataFrame, ephemTwoData: pd.DataFrame
) -> pd.DataFrame:
    """Difference ephemeris, assume same time step for obs and filter
    * Currently requires that double points exists at the same time

    Args:
        ephemOneData (pd.DataFrame): data frame containing first set of ephemeris
        (time-pos-vel)
        ephemTwoData (pd.DataFrame): data frame containing second set of ephemeris
        (time-pos-vel)

    Returns:
        pd.DataFrame: data frame containing the differenced ephemeris values
        (time-pos-vel)
    """
    header = ["Time", "X Pos", "Y Pos", "Z Pos", "X Vel", "Y Vel", "Z Vel"]
    diffedData = pd.DataFrame(columns=header)

    ephemOneLength = ephemOneData.shape[0]
    ephemTwoLength = ephemTwoData.shape[0]

    # shortening one if it's a different length
    if ephemOneLength > ephemTwoLength:
        lengDiff = ephemOneLength - ephemTwoLength
        ephemOneData = ephemOneData.head(-lengDiff)
        diffedData["Time"] = ephemOneData["Time"]
    elif ephemTwoLength > ephemOneLength:
        lengDiff = ephemTwoLength - ephemOneLength
        ephemTwoData = ephemTwoData.head(-lengDiff)
        diffedData["Time"] = ephemTwoData["Time"]
    else:
        diffedData["Time"] = ephemOneData["Time"]

    diffedData["X Pos"] = np.array(ephemOneData["X Pos"]) - np.array(
        ephemTwoData["X Pos"]
    )
    diffedData["Y Pos"] = np.array(ephemOneData["Y Pos"]) - np.array(
        ephemTwoData["Y Pos"]
    )
    diffedData["Z Pos"] = np.array(ephemOneData["Z Pos"]) - np.array(
        ephemTwoData["Z Pos"]
    )
    diffedData["X Vel"] = np.array(ephemOneData["X Vel"]) - np.array(
        ephemTwoData["X Vel"]
    )
    diffedData["Y Vel"] = np.array(ephemOneData["Y Vel"]) - np.array(
        ephemTwoData["Y Vel"]
    )
    diffedData["Z Vel"] = np.array(ephemOneData["Z Vel"]) - np.array(
        ephemTwoData["Z Vel"]
    )
    return diffedData


def plotDiffedPosVelICRFData(diffedData: pd.DataFrame) -> List[plt.Figure]:
    """Plot differenced ephemeris

    Args:
        diffedData (pd.DataFrame): data frame containing differenced ephemeris
        (time-pos-vel)

    Returns:
        List[plt.Figure]: a list of figure handles
    """
    figs = []
    fig, spAxes = plt.subplots(nrows=2, ncols=3)
    diffedData.plot(
        x="Time",
        y="X Pos",
        xlabel="Time (s)",
        ylabel="X Pos (m)",
        legend=False,
        title="Diffed X Pos ICRF",
        ax=spAxes[0, 0],
    )
    diffedData.plot(
        x="Time",
        y="Y Pos",
        xlabel="Time (s)",
        ylabel="Y Pos (m)",
        legend=False,
        title="Diffed Y Pos ICRF",
        ax=spAxes[0, 1],
    )
    diffedData.plot(
        x="Time",
        y="Z Pos",
        xlabel="Time (s)",
        ylabel="Z Pos (m)",
        legend=False,
        title="Diffed Z Pos ICRF",
        ax=spAxes[0, 2],
    )
    diffedData.plot(
        x="Time",
        y="X Vel",
        xlabel="Time (s)",
        ylabel="X Vel (m/s)",
        legend=False,
        title="Diffed X Vel ICRF",
        ax=spAxes[1, 0],
    )
    diffedData.plot(
        x="Time",
        y="Y Vel",
        xlabel="Time (s)",
        ylabel="Y Vel (m/s)",
        legend=False,
        title="Diffed Y Vel ICRF",
        ax=spAxes[1, 1],
    )
    diffedData.plot(
        x="Time",
        y="Z Vel",
        xlabel="Time (s)",
        ylabel="Z Vel (m/s)",
        legend=False,
        title="Diffed Z Vel ICRF",
        ax=spAxes[1, 2],
    )
    figs.append(fig)
    return figs

def differenceDiagsCovSameStep(
    ephemOneData: pd.DataFrame, ephemTwoData: pd.DataFrame
) -> pd.DataFrame:
    """Difference the diagonals of a lower triangular covariance matrix if they have the
    same obs step

    Args:
        ephemOneData (pd.DataFrame): data frame containing first set of ephemeris
        (time-pos-vel)
        ephemTwoData (pd.DataFrame): data frame containing second set of ephemeris
        (time-pos-vel)

    Returns:
        pd.DataFrame: data frame containing the differenced diagonal values
    """
    figs = []
    fig, spAxes = plt.subplots(nrows=2, ncols=3)
    header = ["Time", "X Pos", "Y Pos", "Z Pos", "X Vel", "Y Vel", "Z Vel"]
    ephemOneDiags = pd.DataFrame(columns=header)
    ephemOneDiags["Time"] = ephemOneData["Time"]
    ephemOneDiags["X Pos"] = ephemOneData["[0][0]"]
    ephemOneDiags["Y Pos"] = ephemOneData["[1][1]"]
    ephemOneDiags["Z Pos"] = ephemOneData["[2][2]"]
    ephemOneDiags["X Vel"] = ephemOneData["[3][3]"]
    ephemOneDiags["Y Vel"] = ephemOneData["[4][4]"]
    ephemOneDiags["Z Vel"] = ephemOneData["[5][5]"]

    # ephemTwoData = readLowerTriangularCovariance(ephemTwoPath)
    ephemTwoDiags = pd.DataFrame(columns=header)
    ephemTwoDiags["Time"] = ephemTwoData["Time"]
    ephemTwoDiags["X Pos"] = ephemTwoData["[0][0]"]
    ephemTwoDiags["Y Pos"] = ephemTwoData["[1][1]"]
    ephemTwoDiags["Z Pos"] = ephemTwoData["[2][2]"]
    ephemTwoDiags["X Vel"] = ephemTwoData["[3][3]"]
    ephemTwoDiags["Y Vel"] = ephemTwoData["[4][4]"]
    ephemTwoDiags["Z Vel"] = ephemTwoData["[5][5]"]

    diffedDiags = pd.DataFrame(columns=header)

    ephemOneLength = ephemOneDiags.shape[0]
    ephemTwoLength = ephemTwoDiags.shape[0]

    # shortening one if it's a different length
    if ephemOneLength > ephemTwoLength:
        lengDiff = ephemOneLength - ephemTwoLength
        ephemOneDiags = ephemOneDiags.head(-lengDiff)
        diffedDiags["Time"] = ephemOneDiags["Time"]
    elif ephemTwoLength > ephemOneLength:
        lengDiff = ephemTwoLength - ephemOneLength
        ephemTwoDiags = ephemTwoDiags.head(-lengDiff)
        diffedDiags["Time"] = ephemTwoDiags["Time"]
    else:
        diffedDiags["Time"] = ephemOneDiags["Time"]

    diffedDiags["X Pos"] = np.array(ephemOneDiags["X Pos"]) - np.array(
        ephemTwoDiags["X Pos"]
    )
    diffedDiags["Y Pos"] = np.array(ephemOneDiags["Y Pos"]) - np.array(
        ephemTwoDiags["Y Pos"]
    )
    diffedDiags["Z Pos"] = np.array(ephemOneDiags["Z Pos"]) - np.array(
        ephemTwoDiags["Z Pos"]
    )
    diffedDiags["X Vel"] = np.array(ephemOneDiags["X Vel"]) - np.array(
        ephemTwoDiags["X Vel"]
    )
    diffedDiags["Y Vel"] = np.array(ephemOneDiags["Y Vel"]) - np.array(
        ephemTwoDiags["Y Vel"]
    )
    diffedDiags["Z Vel"] = np.array(ephemOneDiags["Z Vel"]) - np.array(
        ephemTwoDiags["Z Vel"]
    )

    diffedDiags.plot(
        x="Time",
        y="X Pos",
        xlabel="Time (s)",
        ylabel="X Pos (m)",
        legend=False,
        title="Diffed X Pos Cov ICRF",
        ax=spAxes[0, 0],
    )
    diffedDiags.plot(
        x="Time",
        y="Y Pos",
        xlabel="Time (s)",
        ylabel="Y Pos (m)",
        legend=False,
        title="Diffed Y Pos Cov ICRF",
        ax=spAxes[0, 1],
    )
    diffedDiags.plot(
        x="Time",
        y="Z Pos",
        xlabel="Time (s)",
        ylabel="Z Pos (m)",
        legend=False,
        title="Diffed Z Pos Cov ICRF",
        ax=spAxes[0, 2],
    )
    diffedDiags.plot(
        x="Time",
        y="X Vel",
        xlabel="Time (s)",
        ylabel="X Vel (m/s)",
        legend=False,
        title="Diffed X Vel Cov ICRF",
        ax=spAxes[1, 0],
    )
    diffedDiags.plot(
        x="Time",
        y="Y Vel",
        xlabel="Time (s)",
        ylabel="Y Vel (m/s)",
        legend=False,
        title="Diffed Y Vel Cov ICRF",
        ax=spAxes[1, 1],
    )
    diffedDiags.plot(
        x="Time",
        y="Z Vel",
        xlabel="Time (s)",
        ylabel="Z Vel (m/s)",
        legend=False,
        title="Diffed Z Vel Cov ICRF",
        ax=spAxes[1, 2],
    )
    figs.append(fig)
    return diffedDiags


def relativeRICPosVel(
    parentEphem: pd.DataFrame, secEphem: pd.DataFrame
) -> pd.DataFrame:
    """Compute and plot relative RIC for posVel ephem 2 vs posVel ephem 1. Assumes
    original values are in ICRF

    Args:
        parentEphem (pd.DataFrame): data frame containing first set of ephemeris
        (time-pos-vel)
        secEphem (pd.DataFrame): data frame containing second set of ephemeris
        (time-pos-vel)

    Returns:
        pd.DataFrame: data frame containing the differenced RIC values (time-pos-vel)
    """
    # sec - parent, sat2 - sat1
    # diffedICRF = differencePosVelICRFSameStep(secEphem, parentEphem)
    posVelByTime = []
    # create transform from parentEphem, get the diffed data into RIC of parent
    # could swap secEphem with diffedICRF
    for parentData, diffedData in zip(parentEphem.itertuples(), secEphem.itertuples()):
        x, y, z, xdot, ydot, zdot = (
            parentData._2,
            parentData._3,
            parentData._4,
            parentData._5,
            parentData._6,
            parentData._7,
        )
        rmag = np.sqrt((x**2) + (y**2) + (z**2))
        rbyrdot = np.sqrt(
            ((((y * zdot) - (z * ydot))) ** 2)
            + (((z * xdot) - (x * zdot)) ** 2)
            + (((x * ydot) - (y * xdot)) ** 2)
        )
        c1 = ((y * zdot) - (z * ydot)) / rbyrdot
        c2 = ((z * xdot) - (x * zdot)) / rbyrdot
        c3 = ((x * ydot) - (xdot * y)) / rbyrdot
        r1 = x / rmag
        r2 = y / rmag
        r3 = z / rmag
        i1 = (c2 * r3) - (c3 * r2)
        i2 = (c3 * r1) - (c1 * r3)
        i3 = (c1 * r2) - (c2 * r1)
        # X pos, Y pos sign incorrect
        # X Vel halved and sign, Y Vel diverges over time
        dcm = np.array([[r1, r2, r3], [i1, i2, i3], [c1, c2, c3]])
        diffx, diffy, diffz, diffxdot, diffydot, diffzdot = (
            diffedData._2,
            diffedData._3,
            diffedData._4,
            diffedData._5,
            diffedData._6,
            diffedData._7,
        )
        diffPos = np.array([[diffx], [diffy], [diffz]])
        diffVel = np.array([[diffxdot], [diffydot], [diffzdot]])
        relPos = dcm @ diffPos
        relVel = dcm @ diffVel
        relPosEntry = [h for hs in relPos for h in hs]
        relVelEntry = [p for ps in relVel for p in ps]
        relPosEntry.insert(0, parentData.Time)
        for velVal in relVelEntry:
            relPosEntry.append(velVal)
        posVelByTime.append(relPosEntry)

    header = ["Time", "X Pos", "Y Pos", "Z Pos", "X Vel", "Y Vel", "Z Vel"]
    df = pd.DataFrame(posVelByTime, columns=header)
    return df
