#!/bin/bash

# Check if the script is running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Update the system packages
yum update -y

# Install required packages
yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Docker repository
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker
yum install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Check Docker version
docker --version

# Output a message indicating successful installation
echo "Docker has been successfully installed and started."

# Optionally, you can add users to the 'docker' group to run Docker without 'sudo'
# Replace 'username' with the desired username
# usermod -aG docker username

# Note: After adding a user to the 'docker' group, they need to log out and back in
# for group membership changes to take effect.
