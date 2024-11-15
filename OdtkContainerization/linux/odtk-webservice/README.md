# ODTK Flask Webservice Example Docker Image

## Purpose

This Docker image code sample demonstrates how to run ODTK Runtime for Linux through a web service in a containerized environment. It uses simulated observations of a single satellite and provides graphs of residual ratios based on a filter run.

* Note: This example uses the Flask development server, so it is not intended for a production deployment.

## Prerequisites

* Docker must be running on your system.
* Access to an Ansys Licensing Server with a valid ODTK license. Edit the [`licensing.env`](../configuration/licensing.env) file to ensure the `ANSYSLMD_LICENSE_FILE` environment variable has your Ansys License Server information.
* You have already built the [`odtk-python`](../odtk-python/README.md) image.

## Method 1 - Docker CLI

### Build the Image

1. Run `docker build -t ansys/odtk/odtk-webservice:7.10.0-ubi8 .` on the command line in this directory.

### Run the Container

The entrypoint of this container starts the Flask development server in the foreground, listening on the container's port `5000`. To start the container and verify its functionality:

1. Run the following command from this directory:
`docker run -d -p 5000:5000 --env-file ../configuration/licensing.env --name odtk-webservice --rm ansys/odtk/odtk-webservice:7.10.0-ubi8`
    * If port `5000` is already in use on your machine, map a different port (e.g. `1234:5000`).
2. After the container has started, use a web browser to navigate to `http://localhost:5000/satellites/<satellite name>/process`.
    * If you changed the host port mapping above, use that port here instead of `5000`.
    * The example scenario includes two satellites named `Satellite1` and `Satellite2`. Either of those can be used for `<satellite name>`. Any other value will result in a `404` error.
    * It may take a few seconds for the web service application to be ready to accept requests after the container starts. If this url does not work initially, wait a few seconds for the app to be ready and refresh the page.
3. Verify the request returns an array of graphs showing residual ratios.
4. On the command line, run `docker stop odtk-webservice`.

## Method 2 - Docker Compose

### Build the Image

1. On the command line, run `docker compose build`.

### Run the Container

The entrypoint of this container starts the Flask development server in the foreground, listening on the container's port `5000`. To start the container and verify its functionality:

1. On the command line, run `docker compose up -d`.
    * If port `5000` is already in use on your machine, modify the port mapping (e.g. `1234:5000`) in the `ports` settings of the [`docker-compose.yml`](./docker-compose.yml) file before executing step 1.
2. After the container has started, use a web browser to navigate to `http://localhost:5000/satellites/<satellite name>/process`.
    * If you changed the host port mapping above, use that port here instead of `5000`.
    * The example scenario includes two satellites named `Satellite1` and `Satellite2`. Either of those can be used for `<satellite name>`. Any other value will result in a `404` error.
    * It may take a few seconds for the web service application to be ready to accept requests after the container starts. If this url does not work initially, wait a few seconds for the app to be ready and refresh the page.
3. Verify the request returns an array of graphs showing residual ratios.
4. On the command line, run `docker compose down`.
