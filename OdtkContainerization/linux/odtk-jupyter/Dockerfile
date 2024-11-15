ARG baseImage=ansys/odtk/odtk-python:7.10.0-ubi8
FROM ${baseImage}

LABEL JUPYTER_LAB_TOKEN='The token used to initially authenticate with the jupyter lab application. Required.'

COPY --chown=odtk docker-entrypoint.sh "${ODTK_USER_HOME}"/bin/docker-entrypoint.sh

# Install jupyterlab
RUN set -e; \
    pip3 install --no-cache-dir --user jupyterlab matplotlib; \
    mkdir -p "${ODTK_USER_HOME}"/notebooks; \
    chmod 755 "${ODTK_USER_HOME}"/bin/docker-entrypoint.sh

# Mount notebooks from the local file system
VOLUME [ "${ODTK_USER_HOME}/notebooks" ]

# Expose port for jupyterlab
EXPOSE 8888

# Run the Jupyter Lab server in the foreground.
ENTRYPOINT "${ODTK_USER_HOME}"/bin/docker-entrypoint.sh

# Jupyter Lab recommonds using the tini init tool when running in a container.
# If running this container with a "docker run" command instead of using the provided
# docker-compose.yml file, be sure to pass the "--init" flag to the "docker run" command.
