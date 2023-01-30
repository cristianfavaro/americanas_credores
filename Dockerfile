# Image base-notebook
FROM jupyter/minimal-notebook

LABEL Cristian Favaro <cristianfavaroo@gmail.com>

# Change to root user to install java 8
USER root

# Install java 8
RUN apt-get update \
    && echo "Updated apt-get" \
    && apt-get install -y openjdk-8-jre \
    && echo "Installed openjdk 8"
  
# Install requirements
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

RUN rm -rf requirements.txt

# Change to  "$NB_USER" command so the image runs as a non root user by default
USER $NB_UID
