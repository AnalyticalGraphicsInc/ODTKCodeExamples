# Define globally scoped Python version
ARG pythonVersion=3.13.5
ARG pythonMajorMinorVersion=${pythonVersion%.*}

# Uncomment the first ARG line below if you want to use the UBI image from ironbank
# Uncomment the second ARG line below if you want to use the custom UBI image build under custom-environment
# ARG baseImage=registry1.dso.mil/ironbank/redhat/ubi/ubi8:latest
# ARG baseImage=ansys/odtk/custom/redhat/ubi8:latest
ARG baseImage=redhat/ubi8:latest
FROM ${baseImage} AS builder

# Inherits Python version from global scope
ARG pythonVersion
ARG pythonMajorMinorVersion

USER root

# Install basic development utilities
# Install required dependencies for Python 3.x
# Clean all unnecessary files
RUN set -e; \
    echo ${PYTHON_MINOR_VERSION}; \
    yum -y install gcc make tar openssl openssl-devel; \
    yum -y install bzip2-devel libffi-devel tk-devel; \
    yum -y install zlib-devel ncurses-devel sqlite-devel libnsl2-devel; \
    yum -y install readline-devel gdbm-devel libpcap-devel xz-devel; \
    yum clean all; \
    rm -rf /var/cache/yum

# Install Python to the builder stage
WORKDIR /tmp
COPY distributions/Python-${pythonVersion}.tgz /tmp/
RUN tar xf Python-${pythonVersion}.tgz
WORKDIR /tmp/Python-${pythonVersion}
RUN set -e; \
    ./configure --enable-optimizations --enable-shared; \
    make altinstall

# Add the ODTK packages to the builder stage
COPY distributions/odtk*.tgz /tmp/

# Unpack the ODTK packages
RUN set -e; \
    mkdir -p /odtk; \
    find /tmp -name odtk*.tgz -exec tar -zxf {} --strip-components=1 -C /odtk \;

# Final Stage
FROM ${baseImage}

# Inherits Python version from global scope
ARG pythonVersion
ARG pythonMajorMinorVersion

LABEL ANSYSLMD_LICENSE_FILE='Specifies the location of the Ansys Licensing Server. The format should be PORT@FQDN. If using a triad of license server, list all servers in the same format separated by semicolons. Required.'

# Copy Python interpreter, the standard library and pip
COPY --from=builder /usr/local/bin/python${pythonMajorMinorVersion} /usr/local/bin/python${pythonMajorMinorVersion}
COPY --from=builder /usr/local/lib/python${pythonMajorMinorVersion} /usr/local/lib/python${pythonMajorMinorVersion}
COPY --from=builder /usr/local/lib/libpython${pythonMajorMinorVersion}.so.1.0 /usr/local/lib/libpython${pythonMajorMinorVersion}.so.1.0
COPY --from=builder /usr/local/bin/pip${pythonMajorMinorVersion} /usr/local/bin/pip${pythonMajorMinorVersion}

# Install required packages
# Setup non-root ODTK user
RUN set -e; \
    yum -y install libgfortran; \
    useradd -ms /bin/bash odtk; \
    ln -s /usr/lib64/libnsl.so.2 /usr/lib64/libnsl.so.1; \
    ln -s /usr/local/lib/libpython${pythonMajorMinorVersion}.so.1.0 /usr/lib/libpython${pythonMajorMinorVersion}.so.1.0; \
    ln -s /usr/local/bin/python${pythonMajorMinorVersion} /usr/local/bin/python3; \
    ln -s /usr/local/bin/pip${pythonMajorMinorVersion} /usr/local/bin/pip3;

ENV ODTK_USER_HOME=/home/odtk

ENV ODTK_INSTALL_DIR="${ODTK_USER_HOME}" \
    PIP_DEFAULT_TIMEOUT=600 \
    PIP_RETRY=50 \
    PYTHONHOME=/usr/local \
    LD_LIBRARY_PATH="${ODTK_USER_HOME}/bin:/usr/local/lib/python${pythonMajorMinorVersion}/lib-dynload:/usr/lib64" \
    PATH="${ODTK_USER_HOME}/bin:${PATH}" \
    LD_PRELOAD="/usr/local/lib/libpython${pythonMajorMinorVersion}.so.1.0"

# Copy files from the builder stage
COPY --from=builder --chown=odtk /odtk/ "${ODTK_USER_HOME}"/

USER odtk

# Install required Python packages
RUN pip3 install --no-cache-dir --user h5py numpy pandas packaging pyparsing python-dateutil

WORKDIR "${ODTK_USER_HOME}"

# Expose port for ODTK
EXPOSE 9393/tcp

ENTRYPOINT odtkruntime --address=0.0.0.0