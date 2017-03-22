# Jockfiles

Dockerfiles maintained by Jihong

## jihong/nvidia-keras

A Docker image for GPU-enabled Keras.

### Requirements

NVIDIA drivers, [Docker](https://docs.docker.com/engine/installation/linux/ubuntu/) and [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker#quick-start) for Ubuntu 16.04LTS are assumed to be properly installed.

If you are using a cloud compute instance with [TensorFlow supported NVIDIA cards](https://www.tensorflow.org/versions/r0.10/get_started/os_setup#optional_install_cuda_gpus_on_linux), e.g. [Google Cloud Compute Instance](https://cloud.google.com/products/compute/) or [Amazon EC2 instance](https://aws.amazon.com/ec2/?hp=tile&so-exp=below), you can simply install all dependencies by executing the following command from ternimal:


```bash
wget https://raw.githubusercontent.com/JihongJu/Jockerfiles/master/envsetup/instance_init.sh -O /tmp/instance_init.sh
sudo bash /tmp/instance_init.sh
rm /tmp/instance_init.sh
```
Do not run this command if it is your own computer. It may cause incompatible driver problems. The above [script](https://raw.githubusercontent.com/JihongJu/Jockerfiles/master/envsetup/instance_init.sh) also includes tools like vim, tmux, pip, etc. I found myself that these tools are very useful while doing a project with keras. You can of course modify the script if you don't need them.


### Installation

Once all dependencies are properly installed, the docker image can be simply "installed" with command:

```bash
$ docker pull jihong/nvidia-keras:latest
```

Note that this is also the command for upgrading.

Alternatively, one can directly run

```bash
$ nvidia-docker run -it --rm jihong/nvidia-keras nvidia-smi
```

A `docker pull` will be automatically triggered by this command. This will show a summary table for the NVIDIA GPU status if the docker image is successfully running on your machine.


### Usage

Launch bash within the container:

```bash
$ nvidia-docker run -it --rm jihong/nvidia-keras bash
```

By default, this will use TensorFlow as backend. If you prefer theano as backend, you can add an environment variable with:

```bash
$ nvidia-docker run -it --rm -e KERAS_BACKEND='theano' jihong/nvidia-keras bash
```

Mount a local directory to the container may be useful so that a local project can be running in the container:

```bash
$ nvidia-docker run -it --rm -v /path/to/directory/on/host:/root/workspace jihong/nvidia-keras bash
```

where `/path/to/directory/on/host` is the __absolute path__ of the project directory on host, and `/workspace` will be the name of your directory in the container.


Launch Jupyter notebook from the container:

```bash
$ nvidia-docker run -it --rm -p 8888:8888 -v /path/to/directory/on/host:/root/workspace jihong/nvidia-keras
# jupyter notebook &
```

where `-p 8888:8888` denotes the port mapping from host to container in the format of `-p hostPort:containerPort`.
