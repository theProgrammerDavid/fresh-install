sudo pacman -Syyu
yay -Syyu


git clone https://github.com/theProgrammerDavid/config-files ~/config-files
cd ~/config-files
bash ./setup.sh

sudo pacman -S docker docker-compose openssh p7zip p7zip-plugins unrar tar rsync bat binutils teams code fakeroot make cmake gcc
yay -S nodejs

# setup the docker stuff
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker david

echo ''

docker run hello-world

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## BAT ##
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

###
