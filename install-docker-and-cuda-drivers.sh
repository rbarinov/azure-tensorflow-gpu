#!/bin/bash

# installing docker

sudo bash -c "curl -L get.docker.com | sh"
sudo usermod -aG docker $(whoami)

# installing nvidia drivers

wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub

sudo apt update
sudo apt install -yqq cuda-drivers

sudo reboot now
