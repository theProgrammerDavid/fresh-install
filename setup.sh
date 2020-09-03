#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

# install packages
sudo apt install -y curl vim unzip git software-properties-common apt-transport-https wget \
  python3-pip vlc build-essential ca-certificates gnupg-agent




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
####



#### CLEAN-UP ####
sudo apt autoremove

####
