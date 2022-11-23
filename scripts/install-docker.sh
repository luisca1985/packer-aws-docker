#!/bin/bash

# Install Docker Engine on Ubuntu (source: https://docs.docker.com/engine/install/ubuntu/)
## Install using the repository
### Set up the repository
#### 1.Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#### 2. Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#### 3. Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

### Install Docker Engine
#### 1. Update the apt package index:
sudo apt-get update

#### 2. Install Docker Engine, containerd, and Docker Compose.
##### Lastest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
##### Specific version
###### Select the desired version and install:
# VERSION_STRING=5:20.10.13~3-0~ubuntu-jammy
# sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-compose-plugin

# Post-installation steps for Linux (source: https://docs.docker.com/engine/install/linux-postinstall/)
## Manage Docker as a non-root user
### To create the docker group and add your user:
#### 1. Create the docker group
sudo groupadd docker
#### 2. Add your user to the docker group.
sudo usermod -aG docker $USER
#### 3. Log out and log back in so that your group membership is re-evaluated.
##### If you’re running Linux in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
##### You can also run the following command to activate the changes to groups:
newgrp docker

## Configure Docker to start on boot with systemd
### To automatically start Docker and containerd on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Control Docker with systemd (source: https://docker-docs.netlify.app/config/daemon/systemd/)
## Start the Docker daemon
### Start manually
#### Once Docker is installed, you need to start the Docker daemon. Most Linux distributions use systemctl to start services. If you do not have systemctl, use the service command.
##### - systemctl:
sudo systemctl start docker
##### - service:
sudo service docker start
