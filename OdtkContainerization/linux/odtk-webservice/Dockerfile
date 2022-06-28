ARG baseImage=ansys/odtk/odtk-python:7.5.0-centos7
FROM ${baseImage}

# Install Flask
RUN pip install --user --no-cache-dir flask pandas numpy matplotlib

# Copy example web service application
COPY --chown=odtk odtk-webservice.py "${ODTK_USER_HOME}"/odtk-webservice.py
COPY --chown=odtk scenario/ "${ODTK_USER_HOME}"/scenario/

# Configure environment
ENV FLASK_APP=odtk-webservice.py
ENV LANG=en_US.utf8
ENV LC_ALL=en_US.utf8

# Expose the default Flask development server port
EXPOSE 5000/tcp

# Run Flask application
ENTRYPOINT flask run --host=0.0.0.0
