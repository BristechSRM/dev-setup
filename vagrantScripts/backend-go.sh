#! /bin/bash
# Script for installing dev dependencies for go

#
# Install and setup go
#
wget https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.6.linux-amd64.tar.gz
rm go1.6.linux-amd64.tar.gz

#
# Add go environment variables for bash and zsh shells
#
echo '' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
echo '#GO' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
echo 'export GOPATH=/workspace/speaker-comms' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
echo 'export PATH=$PATH:/usr/local/go/bin' | tee -a /home/vagrant/.bashrc /home/vagrant/.zshrc
