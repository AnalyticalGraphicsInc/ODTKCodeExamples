# Uncomment the line below if you want to use the UBI image from ironbank
# ARG baseImage=registry1.dso.mil/ironbank/redhat/ubi/ubi8:latest
ARG baseImage=redhat/ubi8:latest
FROM ${baseImage}

USER root

# CA Certificates Configuration
# Adds additional trusted CAs to the system certificate truststore.
# Delete the following two lines if you do not need any additional trusted CAs.
COPY trusted-certificates/* /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust extract

# Python YUM Configuration
# Provides default Rocky 8 repositories for packages required for newer versions of Python.
# If you override the default yum configuration, the python-yum.repo file will be removed from this image.
COPY python-yum-repositories/*.repo /etc/yum.repos.d/

# YUM Configuration
# Overrides the default configuration for yum repositories built into the base image.
# Delete the following two lines to use the default configuration for yum repositories.
RUN rm /etc/yum.repos.d/*.repo
COPY yum-repositories/* /etc/yum.repos.d/

# PIP Configuration
ENV PIP_CERT=/etc/pki/ca-trust/extracted/openssl/ca-bundle.trust.crt
# Directs python pip installs to pull packages from a specified repository.
# Delete the following two lines if you do not need to override the default pip repository URL.
ARG pipIndexUrl=''
ENV PIP_INDEX_URL=${pipIndexUrl}