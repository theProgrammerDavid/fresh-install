#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo add-apt-repository universe
# install packages
sudo apt install -y curl vim unzip git software-properties-common mycli apt-transport-https bat openssh-server wget \
  python3-pip vlc gparted nmap libgconf-2-4 cmake linux-tools-common linux-tools-generic linux-tools-`uname -r` psensor rofi build-essential vlc build-essential ca-certificates gnupg-agent htop net-tools gnome-tweak-tool mysql-client scrcpy nvtop rofi vim neovim

pip3 install bpytop

# setting up Starship prompt
curl -fsSL https://starship.rs/install.sh | bash


echo "Finished installing base packages"

#### CONFIG FILE SETUP ####

git config --global user.email "davidvelho2awesome@gmail.com"
git config --global user.name "theProgrammerDavid"

git clone https://github.com/theProgrammerDavid/config-files.git ~/config-files
cd ~/config-files
bash ./setup.sh

echo "Finished setting up aliases"
#### GIT STUFF ####

git config --global credential.helper store

echo "git setup done"
#### INSTALL VIM PLUG ####
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "vim-plug done"
#### DOCKER SETUP ####

sudo apt-get remove docker docker-engine docker.io containerd runc -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io 
sudo usermod -aG docker $USER

echo "docker setup done"
#### DOCKER COMPOSE SETUP
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

echo "docker compose setup done"
### NODE-JS SETUP ####
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
nvm install `nvm list-remote | tail -n1`

echo "nodejs setup done"
#### CLEAN-UP ####
sudo apt autoremove -y
rm -rf ~/config-files

## Setting up .config folder
echo "Setting up .config folder"
cp -r ./.config/* ~/.config/ 
echo "Finished setting up .config folder"

echo "done with cleanup"
####
### BAT 
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
echo "export PATH=$PATH:~/.local/bin" >> ~/.bashrc

###
## Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Mongodb Compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.24.6_amd64.deb
sudo dpkg -i ./mongodb-compass_1.24.6_amd64.deb


## CARGO STUFF
cargo install exa

##

## Openssh Server Keys
cd ~
mkdir .ssh
cd .ssh
curl https://github.com/theProgrammerDavid.keys > authorized_keys

