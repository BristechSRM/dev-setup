#! /bin/bash

#
# Script for installing optional tools/utilities for development
#
sudo apt-get update
# Get terminator. Better terminal emulator
sudo apt-get install -y terminator

# Get git. nesseccary for oh-my-zsh
sudo apt-get install -y git

# Get zsh and install oh-my-zsh (see: https://raw.github.com/robbyrussell/oh-my-zsh)
sudo apt-get install -y zsh
sudo chsh vagrant -s /bin/zsh
zsh -f
sudo su vagrant sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
bash
sed -i '8s/.*/ZSH_THEME="bira"/' .zshrc
sed -i '52s/.*/plugins=(git aws npm node)/' .zshrc

# add dos to unix converter
# E.g. fromdos build.sh
sudo apt-get install tofrodos

# Atom editor
wget -O /tmp/atom-amd64.deb https://atom.io/download/deb
sudo dpkg -i /tmp/atom-amd64.deb
mkdir -p /home/vagrant/.atom
cp /workspace/vagrantScripts/configs/atomconfig.cson /home/vagrant/.atom/config.cson
chown vagrant:vagrant -R /home/vagrant/.atom

# Firefox
sudo apt-get install -y firefox

# Chromium
sudo apt-get install -y chromium-browser

# Pull ionide installer to be run on first run of atom
su -c "apm install ionide-installer" vagrant

# Pip
sudo apt-get install -y python-pip
sudo pip install --upgrade pip

# Aws cli
sudo pip install awscli

#Set the default output format for aws
su -c "aws configure set output json" vagrant
#Set the default region for aws
su -c "aws configure set region eu-west-1" vagrant
