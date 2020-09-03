#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

# install packages
sudo apt install -y curl vim unzip git




#### INSTALL VIM PLUG ####
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

####
