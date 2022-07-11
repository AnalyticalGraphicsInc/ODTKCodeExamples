# Builder stage
ARG baseImage=centos:7
FROM ${baseImage} AS builder

# Add the ODTK packages to the builder stage
COPY distributions/odtk*.tgz /tmp/

# Unpack the ODTK packages
RUN set -e; \
    mkdir -p /odtk; \
    find /tmp -name odtk*.tgz -exec tar -zxf {} --strip-components=1 -C /odtk \;

# Final Stage
FROM ${baseImage}

LABEL ANSYSLMD_LICENSE_FILE='Specifies the location of the Ansys Licensing Server. The format should be PORT@FQDN. If using a triad of license server, list all servers in the same format separated by semicolons.  Required.'

# Install Required Python
ENV PYTHON_PACKAGE=rh-python38
RUN set -e; \
    if ! yum list | grep "${PYTHON_PACKAGE}">/dev/null; then \
        yum -y install centos-release-scl; \
    fi; \
    yum -y install "${PYTHON_PACKAGE}"; \
    echo "source scl_source enable ${PYTHON_PACKAGE}" > /etc/profile.d/enable-python.sh
SHELL [ "/bin/sh", "--login", "-c" ]

# Upgrade Pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Setup non-root ODTK user
ENV ODTK_USER_HOME=/home/odtk
RUN useradd -ms /bin/bash odtk
WORKDIR "${ODTK_USER_HOME}"

# Copy files from the builder stage
COPY --from=builder --chown=odtk /odtk/ "${ODTK_USER_HOME}"/

# Configure environment
ENV LD_LIBRARY_PATH="${ODTK_USER_HOME}/bin"
ENV ODTK_INSTALL_DIR="${ODTK_USER_HOME}"
ENV PATH="${ODTK_USER_HOME}/bin:${PATH}"
ENV PYTHONHOME="/opt/rh/${PYTHON_PACKAGE}/root/usr"

# Expose port for ODTK
EXPOSE 9393/tcp

# Switch to non-root ODTK user
USER odtk

# Install required Python packages
RUN pip install --no-cache-dir --user h5py numpy pandas packaging pyparsing python-dateutil pytz

ENTRYPOINT odtkruntime --address=0.0.0.0