ARG baseImage=ansys/odtk/odtk-python:7.8.0-ubi8
FROM ${baseImage}

# Install Flask
RUN pip3 install --user --no-cache-dir flask pandas numpy matplotlib

# Copy example web service application
COPY --chown=odtk odtk-webservice.py "${ODTK_USER_HOME}"/odtk-webservice.py
COPY --chown=odtk scenario/ "${ODTK_USER_HOME}"/scenario/

# Configure environment
ENV FLASK_APP=odtk-webservice.py \
    LANG=en_US.utf8 \
    LC_ALL=en_US.utf8

# Expose the default Flask development server port
EXPOSE 5000/tcp

# Run Flask application
ENTRYPOINT flask run --host=0.0.0.0
