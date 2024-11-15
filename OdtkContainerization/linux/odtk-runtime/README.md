# ODTK Runtime Docker Image

## Purpose

This Docker image code sample demonstrates how to install ODTK Runtime for Linux in a containerized environment.

## Prerequisites

* Docker must be running on your system.
* By default, this sample uses the `redhat/ubi8:latest` Docker image as its baseline. If you are not able to pull images directly from Dockerhub on your system, you must load the baseline OS image on your system before building this image.
* ODTK requires a specific version of Python to run properly. This image builds that version of Python from source code. Follow instructions on downloading the Python source code below.
* Access to an Ansys Licensing Server with a valid ODTK license. Edit the [`licensing.env`](../configuration/licensing.env) file to ensure the `ANSYSLMD_LICENSE_FILE` environment variable has your Ansys License Server information.

## Special Configuration

This image is built using the `yum` and `pip` tools to install package dependencies. Please see the [`custom-environment`](../custom-environment/README.md) Docker image code sample project and build the `custom/redhat/ubi8:latest` image, if needed, before proceeding with this image.

## Method 1 - Docker CLI

### Build the Image

1. Download version 7.4.0 or later of ODTK for Linux from [AGI Downloads](https://support.agi.com/downloads).
2. Unzip this file and copy the `odtk_binaries_v7.10.0.tgz` and `odtk_data_v7.10.0.tgz` into the [`distributions`](./distributions) folder at the same level as this file.
3. Download Python source code from https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tgz and copy the file into the [`distributions`](./distributions) folder at the same level as this file.
4. Build the image
    * If you did not build the `custom-environment` image described above, run `docker build -t ansys/odtk/odtk-runtime:7.10.0-ubi8 .` on the command line in this directory.
    * If you did build the `custom-environment` image described above, run `docker build -t ansys/odtk/odtk-runtime:7.10.0-ubi8 --build-arg baseImage=ansys/odtk/custom/redhat/ubi8:latest .` on the command line in this directory.

### Run the Container

This image starts the ODTK runtime application listening for connections on port `9393`. To start the container and verify its functionality:

1. Run the following command from this directory:
`docker run -d -it -p 9393:9393 --env-file ../configuration/licensing.env --name odtk-runtime --rm ansys/odtk/odtk-runtime:7.10.0-ubi8`
    * If port `9393` is already in use on your machine, map a different port (e.g. `1234:9393`).
2. In a web browser, navigate to `http://localhost:9393/v1.0/ODTK.application.appVersion`. If you changed the host port mapping in the step above, use that port here instead of `9393`. Verify the resulting page contains the correct version of ODTK running in your container.
3. Shut down the container by typing the command `docker stop odtk-runtime`.

## Method 2 - Docker Compose

### Build the Image

1. Download version 7.4.0 or later of ODTK for Linux from [AGI Downloads](https://support.agi.com/downloads).
2. Unzip this file and copy the `odtk_binaries_v7.10.0.tgz` and `odtk_data_v7.10.0.tgz` into the [`distributions`](./distributions) folder at the same level as this file.
3. If you built the `custom-environment` images described in the [Special Configuration](#special-configuration) section, edit the [`docker-compose.yml`](./docker-compose.yml) file to set the value of the `baseImage` build argument to `custom/redhat/ubi8:latest`.
4. On the command line, run `docker compose build`.

### Run the Container

This image starts the ODTK runtime application listening for connections on port `9393`. To start the container and verify its functionality:

1. Run the following command from this directory: `docker compose up -d`.
    * If port `9393` is already in use on your machine, modify the port mapping (e.g. `1234:9393`) in the `ports` settings of the `docker-compose.yml` file before executing step 1.
2. In a web browser, navigate to `http://localhost:9393/v1.0/ODTK.application.appVersion`. If you changed the host port mapping in the step above, use that port here instead of `9393`. Verify the resulting page contains the correct version of ODTK running in your container.
3. Shut down the container by typing the command `docker compose down`.
