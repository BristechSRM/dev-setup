#!/bin/sh -eu
# Script  for installing frontend dev depenedencies

# Install node js & npm

# Set version to install as 4.x change 4 to 5 for 5.x
echo "Installing frontend tools"

wget -qO- https://deb.nodesource.com/setup_4.x | sudo -E /bin/bash -
sudo apt-get update
sudo apt-get install -y nodejs
sudo npm install -g gulp
sudo npm install -g webpack
sudo npm install -g webpack-dev-server

cd /home/vagrant
echo "save-prefix=~" >> /home/vagrant/.npmrc
echo "bin-links=false" >> /home/vagrant/.npmrc
sudo chown vagrant:vagrant -R /home/vagrant/.npmrc

echo "Frontend tools install complete"
