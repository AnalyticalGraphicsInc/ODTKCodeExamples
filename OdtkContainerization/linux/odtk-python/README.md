# ODTK Python API Docker Image

## Purpose

This Docker image code sample demonstrates how to install the ODTK Runtime Python API in a containerized environment.

## Prerequisites

* Docker must be running on your system.
* Access to an Ansys Licensing Server with a valid ODTK license. Edit the [`licensing.env`](../configuration/licensing.env) file to ensure the `ANSYSLMD_LICENSE_FILE` environment variable has your Ansys License Server information.
* You have already built the [`odtk-runtime`](../odtk-runtime/README.md) image.

## Method 1 - Docker CLI

### Build the Image

1. Download version 7.4.0 or later of ODTK for Linux from [AGI Downloads](https://support.agi.com/downloads).
2. Unzip this file and copy the `odtk_codesamples_v${version}.tgz` into the [`distributions`](./distributions) folder at
the same level as this file.
3. Run `docker build -t ansys/odtk/odtk-python:{version}-ubi8 .` on the command line in this directory after replacing `{version}` with the version number. i.e `7.7.1`

### Run the Container

This image starts the `python` interpreter when starting the container. You can verify that ODTK Runtime is working inside the `odtk-python` container with the following steps:

1. Run the following command from this directory after replacing `{version}` with the version number. i.e `7.7.1`:
`docker run -it --env-file ../configuration/licensing.env --name odtk-python --rm ansys/odtk/odtk-python:{version}-ubi8`
2. Execute the following Python commands and verify it returns a valid response:

    ```python
    from odtk import Client
    client = Client()
    root = client.get_root()
    print(root.application.appVersion.eval())
    ```

3. Quit the Python interpreter and the container by executing the command `quit()`

## Method 2 - Docker Compose

### Build the Image

1. Download version 7.4.0 or later of ODTK for Linux from [AGI Downloads](https://support.agi.com/downloads).
2. Unzip this file and copy the `odtk_codesamples_v${version}.tgz` into the [`distributions`](./distributions) folder at the same level as this file.
3. Run `docker compose build` on the command line in this directory.

### Run the Container

This image starts the `python` interpreter when starting the container. You can verify that ODTK Runtime is working inside the `odtk-python` container with the following steps:

1. Run the following command from this directory: `docker compose run --rm odtk-python`
2. Execute the following Python commands and verify it returns a valid response:

    ```python
    from odtk import Client
    client = Client()
    root = client.get_root()
    print(root.application.appVersion.eval())
    ```

3. Quit the Python interpreter and the container by executing the command `quit()`
