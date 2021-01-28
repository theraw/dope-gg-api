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

# installing php
bash installers/php72.sh
bash installers/ioncube.sh

# installing web 
bash installers/nginx.sh
curl -s https://raw.githubusercontent.com/theraw/dope-gg-api/master/core/installers/configs/init/nginx > /etc/init.d/nginx; chmod +x /etc/init.d/nginx
cd /etc/systemd/system/; wget https://raw.githubusercontent.com/theraw/The-World-Is-Yours/master/UBUNTU16/nginx.service
systemctl start nginx.service && systemctl enable nginx.service
systemctl daemon-reload
service nginx stop
service php7.2-fpm stop
cd /tmp; git clone https://github.com/theraw/dope-gg-api.git; mv /tmp/dope-gg-api/core/web /opt/www/dopegg/public_html; rm -Rf /tmp/dope-gg-api
chown -R nginx:nginx /opt/www/dopegg/public_html

# Setup nginx api end.
bash installers/api.sh

# install mysql
apt-get install software-properties-common -y; apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
add-apt-repository 'deb [arch=amd64] http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.5/ubuntu bionic main'
apt-get update -y; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y
echo "`openssl rand -base64 18`" > /root/MYSQL_PASSWORD
export DEBIAN_FRONTEND="noninteractive"
rootpw=(`cat /root/MYSQL_PASSWORD`)
sudo debconf-set-selections <<< "maria-db-10.5 mysql-server/root_password password $rootpw"
sudo debconf-set-selections <<< "maria-db-10.5 mysql-server/root_password_again password $rootpw"
sudo apt-get install -qq mariadb-server -y

service mysql stop
clear
service mysql start
mysql -u root -p$rootpw -e "GRANT ALL PRIVILEGES ON *.* TO 'dopegg'@'%' IDENTIFIED BY '$rootpw' WITH GRANT OPTION;"
mysql -u root -p$rootpw -e "create database dopegg;"
service nginx start
service php7.2-fpm start