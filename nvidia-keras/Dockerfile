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
    vim \
    python-setuptools \
    python-virtualenv

# Install keras and theano dependencies not included in
# https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile.gpu
RUN pip install -U pip && pip --no-cache-dir install --upgrade \
    pandas \
    h5py \
    pyyaml \
    virtualenv

# Install theano and keras
RUN pip --no-cache-dir install \
    theano \
    keras

# Set keras backend to tensorflow by default
ENV KERAS_BACKEND tensorflow

# Add /root/workspace to PYTHONPATH for convenience
ENV PYTHONPATH /root/workspace:$PYTHONPATH

# Set the working directory
WORKDIR /root

# CMD defines the default command to be run in the container
# CMD is overridden by supplying a command + arguments to
# `docker run`, e.g. `nvcc --version` or `bash`
CMD bash
