# Jockfiles

Dockerfiles maintained by Jihong

## jihong/nvidia-keras

A Docker image for GPU-enabled Keras.

### Requirements

NVIDIA drivers, [Docker](https://docs.docker.com/engine/installation/linux/ubuntu/) and [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker#quick-start) for Ubuntu 16.04LTS are assumed to be properly installed.

If you have a brand new Ubuntu system with [TensorFlow supported NVIDIA cards](https://www.tensorflow.org/versions/r0.10/get_started/os_setup#optional_install_cuda_gpus_on_linux), e.g. [Google Cloud Compute Instance](https://cloud.google.com/products/compute/) or [Amazon EC2 instance](https://aws.amazon.com/ec2/?hp=tile&so-exp=below), you can simply install all dependencies by executing the following command from ternimal:


```bash
wget https://raw.githubusercontent.com/JihongJu/Jockerfiles/master/envsetup/instance_init.sh -O /tmp/instance_init.sh
sudo bash /tmp/instance_init.sh
rm /tmp/instance_init.sh
```

Note that the above [script](https://raw.githubusercontent.com/JihongJu/Jockerfiles/master/envsetup/instance_init.sh) also includes tools like vim, tmux, pip, etc. I found myself that these tools are very useful while doing a project with keras. You can of course modify the script if you don't need them.

### Usage

Launch bash within the keras docker container:

```bash
$ nvidia-docker run -it --rm jihong/nvidia-keras bash
```

Mount a local directory to the container such that a local project can be running in the container:

```bash
$ nvidia-docker run -it --rm -v /path/to/directory/on/host:/workspace jihong/nvidia-keras bash
```

where `/path/to/directory/on/host` is the __absolute path__ of the project directory on host, and `/workspace` will be the name of your directory in the container.


Launch Jupyter notebook from the container:

```bash
$ nvidia-docker run -it --rm -p 8888:8888 -v /path/to/directory/on/host:/workspace jihong/nvidia-keras jupyter notebook
```

where `-p 8888:8888` denotes the port mapping from host to container in the format of `-p hostPort:containerPort`.
