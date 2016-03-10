#! /bin/bash
# Script for installing dev dependencies for backend technologies

#
# Install mono et al
#
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update

sudo apt-get install -y mono-devel fsharp

#
# Install docker
#
sudo apt-get install -y  apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Dependent on Ubuntu Version add corrent repo for docker
#sudo echo "deb https://apt.dockerproject.org/repo ubuntu-precise main"| sudo tee /etc/apt/sources.list.d/docker.list
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
#sudo echo "deb https://apt.dockerproject.org/repo ubuntu-wily main"| sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install -y docker-engine

#
# Install and setup go
#
sudo apt-get install -y golang

#
# Add go environment variables for bash and zsh shells
#
echo '' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
echo '#GO' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
echo 'export GOPATH=/workspace/speaker-comms' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
