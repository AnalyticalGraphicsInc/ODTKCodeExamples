# Uncomment the first ARG line below if you want to use the UBI image from ironbank
# Uncommnet the second ARG line below if you want to use the custom UBI image build under custom-environment
# ARG baseImage=registry1.dso.mil/ironbank/redhat/ubi/ubi8:latest
# ARG baseImage=custom/redhat/ubi8:latest
ARG baseImage=redhat/ubi8:latest
FROM ${baseImage} AS builder

# Add the ODTK packages to the builder stage
COPY distributions/odtk*.tgz /tmp/

# Unpack the ODTK packages
RUN set -e; \
    mkdir -p /odtk; \
    find /tmp -name odtk*.tgz -exec tar -zxf {} --strip-components=1 -C /odtk \;

# Final Stage
FROM ${baseImage}

LABEL ANSYSLMD_LICENSE_FILE='Specifies the location of the Ansys Licensing Server. The format should be PORT@FQDN. If using a triad of license server, list all servers in the same format separated by semicolons. Required.'

# Install Required Python
RUN set -e; \
    yum install python38 -y

# Upgrade Pip to the latest version
RUN pip3 install --no-cache-dir --upgrade pip

# Setup non-root ODTK user
ENV ODTK_USER_HOME=/home/odtk
RUN useradd -ms /bin/bash odtk
WORKDIR "${ODTK_USER_HOME}"

RUN ln -s /usr/lib64/libnsl.so.2 /usr/lib64/libnsl.so.1
RUN ln -s /usr/lib64/libpython3.8.so.1.0 /usr/lib/libpython3.8.so.1.0

# Copy files from the builder stage
COPY --from=builder --chown=odtk /odtk/ "${ODTK_USER_HOME}"/

# Configure environment
ENV PYTHONHOME="/usr"
ENV ODTK_INSTALL_DIR="${ODTK_USER_HOME}"
ENV LD_LIBRARY_PATH="${ODTK_USER_HOME}/bin:${PYTHONHOME}/lib64/python3.8/lib-dynload:${PYTHONHOME}/lib64"
ENV PATH="${ODTK_USER_HOME}/bin:${PATH}"
ENV LD_PRELOAD="${PYTHONHOME}/lib/libpython3.8.so.1.0"

# Expose port for ODTK
EXPOSE 9393/tcp

# Switch to non-root ODTK user
USER odtk

# Install required Python packages
RUN pip3 install --no-cache-dir --user h5py numpy pandas packaging pyparsing python-dateutil pytz

ENTRYPOINT odtkruntime --address=0.0.0.0