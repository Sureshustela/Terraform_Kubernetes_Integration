#!/bin/bash

# ***********************************
# Author        : Suresh U
# Date          : 13/01/2026
# Description   : To install docker & kubectl,eksctl
# Version       : v1
# ***********************************
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-varVol
xfs_growfs /var

# Update system packages
sudo dnf update -y

# Install DNF plugin utilities
sudo dnf install dnf-plugins-core -y

# Add Docker official repository
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo 

# Install Docker Engine & components
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to Docker group
sudo usermod -aG docker ec2-user

# Install kubectl (EKS compatible version)
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.34.2/2025-11-13/bin/linux/amd64/kubectl

# Makes kubectl executable
chmod +x ./kubectl

# Moves kubectl to user's bin directory and updates PATH
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH

# Detects OS and architecture
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

# Downloads latest eksctl release
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# Extracts eksctl and cleans up archive
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

# Installs eksctl binary system-wide and Removes temporary binary
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

#AWS CLI installation commands
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Verify installations 
docker --version
kubectl version --client
eksctl version  

echo "Docker, kubectl, and eksctl have been installed successfully."


