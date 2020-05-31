#!/bin/bash

echo -n "Enter the name of your package manager [APT,YUM,PACMAN] "
read MANAGER


case $MANAGER in

  APT)
    echo -n "apt"
    ;;

  YUM )
    echo -n "yum"
    ;;

  PACMAN)
    echo -n "pacman"
    ;;

  *)
    echo -n "unknown"
    ;;
esac
