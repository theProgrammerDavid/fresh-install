#!/bin/bash

PACKAGES=()

user_prompt () {
 read -p "Do you want to install $1 (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo $2
    ;;
    * )
        echo No
    ;;
esac
}
user_prompt Flutter installing