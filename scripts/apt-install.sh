#!/bin/bash


echo "Installing git, make, gcc, etc. ..."
sudo apt-get -qqq update
sudo apt-get -yqq install python-software-properties software-properties-common curl git mercurial make checkinstall binutils bison gcc build-essential unzip dnsmasq --no-install-recommends

echo "Installing zsh and oh-my-zsh"
sudo apt-get -yqq install zsh --no-install-recommends
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh /bin/zsh

echo "Installing Node.js..."
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -yqq nodejs

echo "Install NPMs..."
sudo npm cache clean -f
sudo npm install -g n
sudo npm install -g gulp gulp-haml gulp-shell delete gulp-less path gulp-coffee hercule aglio

echo "Installing Docker..."
curl -sSL https://get.docker.io/ | sh
sudo usermod -aG docker vagrant
