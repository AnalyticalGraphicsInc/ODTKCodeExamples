# Builder stage
ARG baseImage=ansys/odtk/odtk-runtime:7.9.0-ubi8
FROM ${baseImage} AS builder

# Add the ODTK Code Samples package to the builder stage
COPY distributions/odtk*.tgz /tmp/

# Unpack the ODTK Code Samples package
RUN set -e; \
    mkdir -p /tmp/odtk; \
    find /tmp -name odtk*.tgz -exec tar -zxf {} --strip-components=1 -C /tmp/odtk \;

# Final Stage
FROM ${baseImage}

# Copy files from the builder stage
COPY --from=builder --chown=odtk /tmp/odtk/CodeSamples/CrossPlatform/python/odtk.py "${ODTK_USER_HOME}"/python/odtk.py

# Configure environment
ENV PATH="${ODTK_USER_HOME}/.local/bin:${PATH}" \
    PYTHONPATH="${ODTK_USER_HOME}/python"

# Use entrypoint script to run Python commands
COPY --chown=odtk docker-entrypoint.sh "${ODTK_USER_HOME}/bin/docker-entrypoint.sh"
RUN chmod +x "${ODTK_USER_HOME}/bin/docker-entrypoint.sh"
ENTRYPOINT [ "docker-entrypoint.sh" ]