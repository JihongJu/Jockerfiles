# FROM defines the base image
FROM gcr.io/tensorflow/tensorflow:latest-gpu
MAINTAINER Jihong Ju <daniel.jihong.ju@gmail.com>

# RUN executes a shell command
# You can chain multiple commands together with && 
# A \ is used to split long lines to help with readability
# This particular instruction installs keras 
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    # tools
    git \
    python-setuptools \
    python-virtualenv

# install libraries data processing
RUN pip install pandas h5py

# install theano and keras
RUN pip install theano keras

# set the working directory 
WORKDIR /root

# CMD defines the default command to be run in the container 
# CMD is overridden by supplying a command + arguments to 
# `docker run`, e.g. `nvcc --version` or `bash`
CMD bash
