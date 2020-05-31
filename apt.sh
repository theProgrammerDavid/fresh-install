#!/bin/bash

PACKAGES=()

install_flutter () {
    echo "Installing flutter"
}

user_prompt () {
 read -p "Do you want to install $1 (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        $2
    ;;
    * )
        echo No
    ;;
esac
}
user_prompt Flutter install_flutter