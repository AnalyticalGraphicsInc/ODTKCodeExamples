"""
Functions to handle logging any necessary events and data to understand each run. This
will include both the variable dictionaries as well as the event logging infrastructure.
"""

import logging
import pickle
import sys
from datetime import datetime
from pathlib import Path


def createMetaDictFile(metaDict: dict, runDir: Path):
    """dumps the meta dictionary to pickle file

    Args:
        metaDict (dict): meta dictionary data
        runDir (Path): the folder for this run
    """
    picklePath = runDir / "metaDict.pkl"
    with picklePath.open("wb") as f:
        pickle.dump(metaDict, f, pickle.HIGHEST_PROTOCOL)


def createInputDictFile(inputDict: dict, runDir: Path):
    """dumps the input dictionary to pickle file

    Args:
        inputDict (dict): input dictionary data
        runDir (Path): the folder for this run
    """
    picklePath = runDir / "inputDict.pkl"
    with picklePath.open("wb") as f:
        pickle.dump(inputDict, f, pickle.HIGHEST_PROTOCOL)


def getInputDictionary(runDir: Path) -> dict:
    """Load input dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: input dictionary
    """
    # Get input pickle file path
    inputPath = runDir / "inputDict.pkl"
    inputPathOld = runDir / "inputDict.pickle"
    # Check to make sure file exists
    if inputPath.exists():
        # Load input dictionary
        with inputPath.open("rb") as inputFile:
            inputDict = pickle.load(inputFile)
    elif inputPathOld.exists():
        # Handles loading if using the old .pickle
        with inputPathOld.open("rb") as inputFile:
            inputDict = pickle.load(inputFile)
    else:
        sys.exit(f"{inputPath} does not exist")

    return inputDict


def getMetaDictionary(runDir: Path) -> dict:
    """Load meta dictionary from pickle file

    Args:
        runDir (Path): the folder for this run

    Returns:
        dict: meta dictionary
    """
    # Get input pickle file path
    metaPath = runDir / "metaDict.pkl"
    metaPathOld = runDir / "metaDict.pickle"
    # Check to make sure file exists
    if metaPath.exists():
        # Load input dictionary
        with metaPath.open("rb") as metaFile:
            metaDict = pickle.load(metaFile)
    elif metaPathOld.exists():
        # Handles loading if using the old .pickle
        with metaPathOld.open("rb") as metaFile:
            metaDict = pickle.load(metaFile)
    else:
        sys.exit(f"{metaPath} does not exist")

    return metaDict


def log(logger: logging.Logger, message: str, loglist: list = None):
    """Log a message to the specified log file

    Args:
        logger (Logger): handle of the logger
        message (str): content to be logged
        loglist (list):  a running list for displayed log messages
    """
    dt = datetime.now()
    dt_formatted = dt.strftime("%Y-%m-%dT%H:%M:%S%z")
    if logger is not None:
        logger.info(message)
    if loglist != None:
        loglist.append(f"{dt_formatted} - {message}\n")
