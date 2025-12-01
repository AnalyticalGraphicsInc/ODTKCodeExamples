# ODTK Runtime Docker Image

## Purpose

This Docker image code sample demonstrates how to install ODTK Runtime for Linux in a containerized environment.

## Prerequisites

* Docker must be installed and running on your system.
* By default, this sample uses the `redhat/ubi8:latest` Docker image as its baseline. If you are not able to pull images directly from Dockerhub on your system, you must load the baseline OS image on your system before building this image.
* Access to an Ansys Licensing Server with a valid ODTK license. Edit the [`licensing.env`](../configuration/licensing.env) file to ensure the `ANSYSLMD_LICENSE_FILE` environment variable has your Ansys License Server information.
* Download version 13.0.1 or later of ODTK for Linux from [AGI Downloads](https://support.agi.com/downloads). Unzip this file and copy the `odtk_binaries_v13.0.1.tgz` and `odtk_data_v13.0.1.tgz` into the [`distributions`](./distributions) folder at the same level as this file.
* Download Python source code from https://www.python.org/ftp/python/3.13.5/Python-3.13.5.tgz and copy the file into the [`distributions`](./distributions) folder at the same level as this file.
> [!NOTE]
> ODTK requires Python version 3.9 or later to run properly. We recommend using a 3.13.X version, since we test with 3.13.5. Follow instructions on downloading the Python source code below. If you do not want to use the default version, you can do one of the following:
>    * Update the `pythonVersion` build argument in the `Dockerfile`.
>    * Specify `--build-arg pythonVersion=<your_python_version>` as a command line argument to `docker build` if you are building with `docker build`.
>    * Add `pythonVersion: <your_python_version>` to the `args:` list in `docker-compose.yml` if you are building with `docker compose build`.

## Special Configuration

This image is built using the `yum` and `pip` tools to install package dependencies. Please see the [`custom-environment`](../custom-environment/README.md) Docker image code sample project and build the `ansys/odtk/custom/redhat/ubi8:latest` image, if needed, before proceeding with this image.

## Method 1 - Docker CLI

### Build the Image

1. If you did not build the `custom-environment` image described above, run the following in a command line from this directory:

    ```
    docker build -t ansys/odtk/odtk-runtime:13.0.1-ubi8 .
    ```

1. If you did build the `custom-environment` image described above, run the following in a command line from this directory:

    ```
    docker build -t ansys/odtk/odtk-runtime:13.0.1-ubi8 --build-arg baseImage=ansys/odtk/custom/redhat/ubi8:latest .
    ```


### Run the Container

This image starts the ODTK runtime application listening for connections on port `9393`. To start the container and verify its functionality:

1. Run the following in a command line from this directory:

    ```
    docker run -d -it -p 9393:9393 --env-file ../configuration/licensing.env --name odtk-runtime --rm ansys/odtk/odtk-runtime:13.0.1-ubi8
    ```

    * If port `9393` is already in use on your machine, map a different port (e.g. `1234:9393`).

1. In a web browser, navigate to `http://localhost:9393/v1.0/ODTK.application.appVersion`. If you changed the host port mapping in the step above, use that port here instead of `9393`. Verify the resulting page contains the correct version of ODTK running in your container.
1. Stop the container by running the following command:

    ```
    docker stop odtk-runtime
    ```


## Method 2 - Docker Compose

### Build the Image

1. If you built the `custom-environment` images described in the [Special Configuration](#special-configuration) section, edit the [`docker-compose.yml`](./docker-compose.yml) file to set the value of the `baseImage` build argument to `ansys/odtk/custom/redhat/ubi8:latest`.
1. Run the following in a command line from this directory:

    ```
    docker compose build
    ```

### Run the Container

This image starts the ODTK runtime application listening for connections on port `9393`. To start the container and verify its functionality:

1. Run the following in a command line from this directory:

    ```
    docker compose up -d
    ```

    * If port `9393` is already in use on your machine, modify the port mapping (e.g. `1234:9393`) in the `ports` settings of the `docker-compose.yml` file before executing step 1.

1. In a web browser, navigate to `http://localhost:9393/v1.0/ODTK.application.appVersion`. If you changed the host port mapping in the step above, use that port here instead of `9393`. Verify the resulting page contains the correct version of ODTK running in your container.
1. Stop the container by running the following command:

    ```
    docker compose down
    ```
