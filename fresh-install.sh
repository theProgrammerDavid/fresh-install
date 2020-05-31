#!/bin/bash

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
