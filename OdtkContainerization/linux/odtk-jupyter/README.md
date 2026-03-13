# ODTK Jupyter Lab Docker Image

## Purpose

This Docker image code sample demonstrates how to run ODTK Runtime for Linux using a Jupyter notebook in a containerized environment.

## Prerequisites

* Docker must be running on your system.
* Access to an Ansys Licensing Server with a valid ODTK license. Edit the [`licensing.env`](../configuration/licensing.env) file to ensure the `ANSYSLMD_LICENSE_FILE` environment variable has your Ansys License Server information.
* You have already built the [`odtk-python`](../odtk-python/README.md) image.

## Method 1 - Docker CLI

### Build the Image

1. Run the following in a command line from this directory:

    ```
    docker build -t ansys/odtk/odtk-jupyter:13.1.0-ubi8 .
    ```

### Run the Container

The entrypoint of this container starts the Jupyter Lab server in the foreground, listening on the container's port `8888`. To start the container and verify its functionality:

1. Run the following in a command line from this directory:

    ```
    docker run -d -e JUPYTER_LAB_TOKEN=ansys-odtk -p 8888:8888 -v <ABSOLUTE PATH TO THIS DIRECTORY>/notebooks:/home/odtk/notebooks -v <ABSOLUTE PATH TO THIS DIRECTORY>/data:/home/odtk/data --env-file ../configuration/licensing.env --init --name odtk-jupyter --rm ansys/odtk/odtk-jupyter:13.1.0-ubi8
    ```

    * If port `8888` is already in use on your machine, map a different port (e.g. `1234:8888`).
    * The `JUPYTER_LAB_TOKEN` can be set to the value of your choice. You will use this value to authenticate with the server.
    * Make sure to replace the `<ABSOLUTE PATH TO THIS DIRECTORY>` placeholder with the appropriate path.
1. After the container has started, use a web browser to navigate to `http://localhost:8888`. If you changed the host port mapping above, use that port here instead of `8888`.
1. Use the value of `JUPYTER_LAB_TOKEN` (default=ansys-odtk) you used in step 1 to authenticate.
1. Open the `example.ipynb` notebook.
1. Execute the notebook to see a calculation of residual ratios for simulated observations.
1. Stop the container by running the following command:

    ```
    docker stop odtk-jupyter
    ```

## Method 2 - Docker Compose

### Build the Image

1. Run the following in a command line from this directory:

    ```
    docker compose build
    ```

### Run the Container

The entrypoint of this container starts the Jupyter Lab server in the foreground, listening on the container's port `8888`. To start the container and verify its functionality:

1.  Run the following in a command line from this directory:

    ```
    docker compose up -d
    ```

    * If port `8888` is already in use on your machine, modify the port mapping (e.g. `1234:8888`) in the `ports` settings of the [`docker-compose.yml`](./docker-compose.yml) file before executing step 1.
    * The `JUPYTER_LAB_TOKEN` can be set to the value of your choice in the [`docker-compose.yml`](./docker-compose.yml) before executing step 1. You will use this value to authenticate with the server.
1. After the container has started, use a web browser to navigate to `http://localhost:8888`.
If you changed the host port mapping in the `docker-compose.yml`, use that port here instead of `8888`.
1. If you modified the `JUPYTER_LAB_TOKEN` environment variable above, enter your custom value to authenticate. Otherwise, use the default value: `ansys-odtk`.
1. Open the `example.ipynb` notebook.
1. Execute the notebook to see a calculation of residual ratios for simulated observations.
1. Stop the container by running the following command:

    ```
    docker compose down
    ```
