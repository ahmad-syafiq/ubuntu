#!/bin/sh

clear && clear
echo '## INSTALL MySQL'
cd ~/tmp/

sudo apt-get remove -y --purge mysql-\*
sudo apt-get purge mysql-\*
echo "Y\n" | sudo apt-get autoremove
sudo apt-get autoclean
echo "Y\n" | sudo apt-get dist-upgrade

wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
# select ubuntu bionic
# select mysql-5.7
# select ok

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
sudo apt update

sudo apt install -f -y mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*
# input root password
# re-type root password

sudo mysql_secure_installation
# input root password
# N => Setup VALIDATE PASSWORD login?
# Y => Change the password for root?
# input root password
# re-type root password
# Y => Remove anonymous users?
# Y => Disallow root login remotely?
# Y => Remove test database and access to it?
# Y => Reload privilege tables now?

sudo cp -f config/mysql/my.cnf /etc/mysql/my.cnf
sudo service mysql restart
sudo systemctl status mysql --no-pager

sudo cp -r config/dump /usr/local/bin/
sudo cp -r config/udump /usr/local/bin/

