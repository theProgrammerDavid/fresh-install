#!/bin/bash

PACKAGES=()


install_flutter() {
    sudo apt install -y vlc
}

user_prompt() {
    read -t 1 -n 10000 discard
    read -p "Do you want to install $1 (y/n)? " answer
    case ${answer:0:1} in
    y | Y)
        PACKAGES+=("$1")
        ;;
    *)
        echo No
        ;;
    esac
}

get_package_manager() {

    echo -n "Enter the name of your package manager [APT,YUM,PACMAN] "
    read MANAGER

    case $MANAGER in

    APT)
        __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        bash ${__dir}/apt.sh
        ;;

    YUM)
        echo -n "yum"
        ;;

    PACMAN)
        echo -n "pacman"
        ;;

    *)
        echo -n "unknown"
        ;;
    esac
}

filename='common.txt'
while read line; do
    # reading each line
    echo "Line : $line"
    user_prompt $line
    
done <$filename


echo "Packages are $PACKAGES."