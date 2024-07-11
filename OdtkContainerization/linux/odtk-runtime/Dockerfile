# Uncomment the first ARG line below if you want to use the UBI image from ironbank
# Uncommnet the second ARG line below if you want to use the custom UBI image build under custom-environment
# ARG baseImage=registry1.dso.mil/ironbank/redhat/ubi/ubi8:latest
# ARG baseImage=ansys/odtk/custom/redhat/ubi8:latest
ARG baseImage=redhat/ubi8:latest
FROM ${baseImage} AS builder

USER root

# Install basic development utilities
# Install required dependencies for Python 3.x
# Clean all unnecessary files
RUN set -e; \
    yum -y install gcc make tar openssl openssl-devel; \
    yum -y install bzip2-devel libffi-devel tk-devel; \
    yum -y install zlib-devel ncurses-devel sqlite-devel libnsl2-devel; \
    yum -y install readline-devel gdbm-devel libpcap-devel xz-devel; \
    yum clean all; \
    rm -rf /var/cache/yum

# Install Python to the builder stage
WORKDIR /tmp
COPY distributions/Python-3.10.9.tgz /tmp/
RUN tar xf Python-3.10.9.tgz
WORKDIR /tmp/Python-3.10.9
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

LABEL ANSYSLMD_LICENSE_FILE='Specifies the location of the Ansys Licensing Server. The format should be PORT@FQDN. If using a triad of license server, list all servers in the same format separated by semicolons. Required.'

# Copy Python interpreter, the standard library and pip
COPY --from=builder /usr/local/bin/python3.10 /usr/local/bin/python3.10
COPY --from=builder /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY --from=builder /usr/local/lib/libpython3.10.so.1.0 /usr/local/lib/libpython3.10.so.1.0
COPY --from=builder /usr/local/bin/pip3.10 /usr/local/bin/pip3.10

# Install required packages
# Setup non-root ODTK user
RUN set -e; \
    yum -y install libgfortran; \
    useradd -ms /bin/bash odtk; \
    ln -s /usr/lib64/libnsl.so.2 /usr/lib64/libnsl.so.1; \
    ln -s /usr/local/lib/libpython3.10.so.1.0 /usr/lib/libpython3.10.so.1.0; \
    ln -s /usr/local/bin/python3.10 /usr/local/bin/python3; \
    ln -s /usr/local/bin/pip3.10 /usr/local/bin/pip3;

ENV ODTK_USER_HOME=/home/odtk

ENV ODTK_INSTALL_DIR="${ODTK_USER_HOME}" \
    PIP_DEFAULT_TIMEOUT=600 \
    PIP_RETRY=50 \
    PYTHONHOME=/usr/local \
    LD_LIBRARY_PATH="${ODTK_USER_HOME}/bin:/usr/local/lib/python3.10/lib-dynload:/usr/lib64" \
    PATH="${ODTK_USER_HOME}/bin:${PATH}" \
    LD_PRELOAD="/usr/local/lib/libpython3.10.so.1.0"

# Copy files from the builder stage
COPY --from=builder --chown=odtk /odtk/ "${ODTK_USER_HOME}"/

USER odtk

# Install required Python packages
RUN pip3 install --no-cache-dir --user h5py numpy pandas packaging pyparsing python-dateutil

WORKDIR "${ODTK_USER_HOME}"

# Expose port for ODTK
EXPOSE 9393/tcp

ENTRYPOINT odtkruntime --address=0.0.0.0
