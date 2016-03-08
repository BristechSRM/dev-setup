#! /bin/bash

#
# Script  for installing frontend dev depenedencies
#

# Install node js & npm

# Set version to install as 4.x change 4 to 5 for 5.x
sudo sh -c "$(wget https://deb.nodesource.com/setup_4.x -O -)"

sudo apt-get install -y nodejs
sudo npm install -g gulp
sudo npm install -g webpack

npm config set bin-links false
cd /home/vagrant
echo "save-prefix=~" >> /home/vagrant/.npmrc
sudo chown vagrant:vagrant -R /home/vagrant/.npmrc
