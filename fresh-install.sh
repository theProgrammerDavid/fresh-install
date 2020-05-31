#!/bin/bash

PACKAGES=()
COMMON=()

install_flutter() {
    sudo apt install -y vlc
}

user_prompt() {
    
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
filename="./common.txt"


arr=()
while IFS= read -r line; do
   arr+=("$line")
done <$filename


# get length of an array
arraylength=${#arr[@]}
# echo "length is ${arraylength}"
# use for loop to read all values and indexes
for (( i=1; i<${arraylength}+1; i++ ));
do
#   echo $i " / " ${arraylength} " : " ${arr[$i-1]}
user_prompt ${arr[$i-1]}
done


echo "Packages are ${PACKAGES[*]}."