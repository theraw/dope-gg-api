#!/bin/bash

if [ "$(whoami)" != "root" ]
    then
        echo "Only root user can use this script.";
        exit 1
fi
if [ "`grep DISTRIB_CODENAME /etc/*-release | awk -F '=' '{print $2}'`" != "bionic" ]
    then
        echo "This script was created/tested on ubuntu 18.04 for other versions use at your own support.";
        exit 1
fi

apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y
apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common sudo -y
apt-get install build-essential libssl-dev curl nano wget zip unzip git -y
curl -sL https://deb.nodesource.com/setup_10.x -o /tmp/nodesource_setup.sh && bash /tmp/nodesource_setup.sh
apt-get install gcc g++ make -y
apt-get install nodejs -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88 -y
echo 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable' >> /etc/apt/sources.list
apt-get update -y; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y
apt-get install docker-ce docker-ce-cli containerd.io -y