import logging
import os
import platform
import socket
import subprocess
import sys
import time
from enum import Enum
from pathlib import Path

import psutil

logger = logging.getLogger()

if platform.system() == "Windows":
    from winreg import HKEY_LOCAL_MACHINE, ConnectRegistry, OpenKey, QueryValueEx

# This code adds the odtk api to the path
if platform.system() == "Windows":
    try:
        registry = ConnectRegistry(None, HKEY_LOCAL_MACHINE)
        key = OpenKey(registry, r"SOFTWARE\AGI\ODTK\7.0")
        value = QueryValueEx(key, "InstallHome")
        odtk_install = Path(value[0])
        logger.info(f"Odtk Install: {odtk_install}")
    except FileNotFoundError as e:
        odtk_install = None
        logger.error("ODTK is not currently installed")
elif platform.system() == "Linux":
    odtk_install = os.environ["ODTK_INSTALL_DIR"]
    logger.info(f"Odtk Install: {odtk_install}")
else:
    odtk_install = None

if odtk_install is not None:
    sys.path.append(
        str(odtk_install / "CodeSamples" / "CrossPlatform" / "ODTK" / "python")
    )

from odtk import AttrProxy, Client


class OdtkType(Enum):
    """Specify the type of ODTK application you are trying to run, either full
    desktop or headless runtime"""

    Desktop = 1
    """ODTK full desktop application. This is for Windows OS only"""
    Runtime = 2
    """ODTK headless runtime application. This is for Windows or Linux OS"""

    def __str__(self) -> str:
        return self.name


class OdtkInstance:
    """A class to manage one instance of either ODTK Desktop or Runtime

    Attributes:
        host (str): Address to use for ODTK API
        port (int): Port to use for ODTK API
        pid (int): Process ID of this ODTK instance
        process (subprocess): Handle of the ODTK subprocess
        client (Client): Handle of the ODTK Client for API usage
        odtk (AttrProxy): Handle of the ODTK Application
        application_type (OdtkType): An enumeration to specify Desktop or Runtime
    """

    def __init__(
        self,
        host: str = "127.0.0.1",
        port: int = 9393,
        application_type: OdtkType = OdtkType.Runtime,
        be_quiet: bool = True,
        log_directory: Path = None,
    ) -> None:
        """Default constructor to make either an ODTK Desktop or Runtime instance

        Args:
            host (str, optional): Address to use for ODTK API. Defaults to "127.0.0.1".
            port (int, optional): Port to use for ODTK API. Defaults to 9393.
            application_type (OdtkType, optional): An enumeration to specify Desktop or
            Runtime. Defaults to OdtkType.Runtime.
            be_quiet (bool, optional):
            log_directory (Path, optional):

        Raises:
            ConnectionRefusedError: This will occur if the request port is in use and it
            is not held by ODTK. Only checking if the requested ODTK application type
            holds the connection. i.e. If port 9393 is being used by ODTK Desktop and
            the constructor was called with
            `OdtkInstance("127.0.0.1", 9393, OdtkType.Runtime)` a ConnectionRefusedError
            would be thrown
        """
        self.host: str = host
        self.port: int = port
        self.pid: int = None
        self.process: subprocess = None
        self.client: Client = None
        self.odtk: AttrProxy = None
        self.application_type: OdtkType = application_type
        self._is_running = False
        self.be_quiet = be_quiet
        self._owner = False
        self.log_directory = log_directory

        if self._check_socket():
            if not self._check_odtk_holds_socket():
                raise ConnectionRefusedError(
                    f"This port is already being used and it is not "
                    f"by an ODTK {self.application_type} instance"
                )
            else:
                # If the port is being used by ODTK simply connect to that instance
                self._connect()
                return

        self._start_odtk()
        self._connect()
        return

    def __str__(self) -> str:
        if self.application_type == OdtkType.Desktop:
            temp_type = "Desktop"
        elif self.application_type == OdtkType.Runtime:
            temp_type = "Runtime"
        return (
            f"ODTK {temp_type} instance open on {self.host}:{self.port}. "
            f"Process ID is {self.pid}"
        )

    def __repr__(self) -> str:
        return (
            f"<ODTK type:{self.application_type} host:{self.host} "
            f"port:{self.port} pid:{self.pid}>"
        )

    # def __del__(self):
    #     if self.client:
    #         self.close()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, traceback):
        if self.client:
            self.close()

    def _connect(self):
        self.client = Client(self.host, self.port)
        self.odtk = self.client.get_root()

        if self.log_directory is not None:
            log_file_path = self.log_directory / "odtk.log"
            self.odtk.SetLogFile(str(log_file_path), False)

    def _check_socket(self):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        if sock.connect_ex((self.host, self.port)) == 0:
            return True
        return False

    def _check_odtk_holds_socket(self):
        if self.application_type is OdtkType.Desktop:
            application = "aguiapplication.exe"
        if self.application_type is OdtkType.Runtime:
            if platform.system() == "Windows":
                application = "odtkruntime.exe"
            elif platform.system() == "Linux":
                application = "odtkruntime"

        for proc in psutil.process_iter():
            if proc.name().lower() == application and "odtk" in proc.exe().lower():
                for connection in proc.connections():
                    if connection.laddr.port == self.port:
                        self.pid = proc.pid
                        self.process = proc
                        return True
        return False

    def _check_is_running(self):
        if self.process.poll() is None:
            self._is_running = True
        else:
            self._is_running = False

    def _get_odtk_executable(self) -> Path:
        if odtk_install is None:
            return None

        if platform.system() == "Windows":
            if self.application_type == OdtkType.Desktop:
                odtk_executable = odtk_install / "bin" / "AgUiApplication.exe"
            elif self.application_type == OdtkType.Runtime:
                odtk_executable = odtk_install / "bin" / "ODTKRuntime.exe"
        elif platform.system() == "Linux":
            odtk_executable = odtk_install / "bin" / "odtkruntime"
        else:
            odtk_executable = None

        return odtk_executable

    def _start_odtk(self):
        """start odtk desktop or runtime on local machine"""
        stdout = None
        if self.be_quiet:
            stdout = subprocess.DEVNULL

        application_path = str(self._get_odtk_executable())

        if application_path is None:
            return

        if self.application_type == OdtkType.Desktop:
            command = (
                f"{application_path} /pers ODTK /enablehttpserver "
                f"/httpserverport {self.port} /httpserveraddress {self.host}"
            )

        if self.application_type == OdtkType.Runtime:
            if platform.system() == "Windows":
                command = f"{application_path} /port {self.port} /address {self.host}"
            elif platform.system() == "Linux":
                command = f"{application_path} --port={self.port} --address={self.host}"

        process = subprocess.Popen(command, stdout=stdout, stderr=stdout)

        self.pid = process.pid
        self.process = process
        self._owner = True

        timeout = 300
        for _ in range(timeout):
            if self._check_socket():
                break
            time.sleep(0.1)
        return

    def is_running(self):
        """check if the process is still running"""
        self._check_is_running()
        return self._is_running

    def close(self):
        """stop odtk application"""
        if self._owner:
            self.odtk.LogMsg(1, "Quitting ODTK.")
            self.odtk.quit()
            self.client.close()

        self.odtk = None
        self.client = None

        if self._owner:
            try:
                self.process.wait(timeout=30)
            except subprocess.TimeoutExpired as e:
                self.process.kill()
                self.process.communicate()

            timeout = 10
            for _ in range(timeout):
                if not self._check_socket():
                    break
                time.sleep(0.5)

        self.pid = None
        self.process = None
