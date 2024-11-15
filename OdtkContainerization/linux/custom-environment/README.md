# Custom Environment Base Image

## Purpose

Many of the images in this collection of code samples are built using the `yum` and `pip` tools to install package dependencies. The image built by this project acts as a layer on top of the baseline OS image which configures these tools to work in your environment.

The image produced by this project is not meant to be run on its own. Instead, it will be used as a baseline for other images in this code sample collection.

### Certificate Authority (CA) Certificates

If your network requires special CA certificates to download packages, copy your CA certificate (`*.crt`) files to the [`trusted-certificates`](./trusted-certificates/) folder at the same level as this file.

If your network doesn't require special CA certificates to download packages, delete the lines for `CA Certificates Configuration` as described in [`Dockerfile`](./Dockerfile).

### Yellowdog Updater Modifier (YUM)

If you need to override the default `yum` repository configuration to download RPM packages, copy your repository configuration (`*.repo`) files to the [`yum-repositories`](./yum-repositories/) folder at the same level as this file.

> [!IMPORTANT]
> ODTK depends on a specific version of Python which is built from source by one of the images in this collection. This process requires downloading packages from yum repositories not provided in the Redhat UBI-8 base image. We provide the `python-yum-repositories/python-yum.repo` file, which configures the following Rocky 8 repositories needed to build Python:
> * Rocky Linux 8 - BaseOS
> * Rocky Linux 8 - AppStream
> * Rocky Linux 8 - PowerTools
>
> If you provide any repo files in the [`yum-repositories`](./yum-repositories/) folder, the default repo file will not be made available, and you will be responsible to configure the above Rocky Linux 8 repositories in addition to your own customizations.

If you don't need to override the default `yum` repository configuration to download RPM packages, delete the lines for `YUM configuration` as described in [`Dockerfile`](./Dockerfile).

### Package Installer for Python (PIP)

If you need to override the default `pip` repository URL to download Python packages, set the `pipIndexUrl` build argument while  building the image as described in the two "Build the Images" sections below.

If you don't need to override the default `pip` repository URL to download Python packages, delete the lines that set the `PIP_INDEX_URL` environment variable in the image as described in `PIP Configuration` in [`Dockerfile`](./Dockerfile).

## Method 1 - Docker CLI

### Build the Images

If you need to override the default `pip` repository URL to download Python packages, run `docker build -t ansys/odtk/custom/redhat/ubi8 --build-arg baseImage=redhat/ubi8:latest --build-arg pipIndexUrl=<Your custom pip index url> .` on the command line in this directory.

If you do not need to override the default `pip` repository URL, run `docker build -t ansys/odtk/custom/redhat/ubi8:latest --build-arg baseImage=redhat/ubi8:latest .` on the command line in this directory.

## Method 2 - Docker Compose

### Build the Images

1. If you need to override the default `pip` repository URL to download Python packages, edit the `docker-compose.yml` file in this directory to set the `pipIndexUrl` for both images.
2. On the command line, run `docker compose build`. This will produce an image on top of the `redhat/ubi8:latest` baseline image that is needed to build the code samples using `yum` or `pip`.