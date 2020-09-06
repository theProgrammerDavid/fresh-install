#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo add-apt-repository universe
# install packages
sudo apt install -y curl vim unzip git software-properties-common apt-transport-https wget \
  python3-pip vlc build-essential ca-certificates gnupg-agent htop net-tools gnome-tweak-tool mysql-client ubuntu-restricted-extras
#### CONFIG FILE SETUP ####

git clone https://github.com/theProgrammerDavid/config-files.git ~/config-files
cd ~/config-files
bash ./setup.sh
#### GIT STUFF ####

git config --global credential.helper store

#### INSTALL VIM PLUG ####
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#### DOCKER SETUP ####

sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

#### DOCKER COMPOSE SETUP
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
### NODE-JS SETUP ####
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
nvm install `nvm list-remote | tail -n1`


#### CLEAN-UP ####
sudo apt autoremove
rm -rf ~/config-files
####
