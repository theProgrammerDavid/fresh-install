#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

# install packages
sudo apt install -y curl vim unzip git software-properties-common apt-transport-https wget \
  python3-pip vlc build-essential




#### INSTALL VIM PLUG ####
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

####
