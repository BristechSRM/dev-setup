#! /bin/bash
# Script for installing dev dependencies for go

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
