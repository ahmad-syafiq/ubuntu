#!/bin/sh

clear && clear
echo '## Install Apache2'

sudo apt install apache2 -y
sudo ufw enable
sudo ufw allow 'Apache Full'
systemctl status apache2 --no-pager

sudo cp -f config/php/apache2.conf /etc/apache2/
sudo cp -f config/php/000-default.conf /etc/apache2/sites-enabled/

sudo chown $USER:$USER /var/www/html
mkdir -p /var/www/html/conf/ && touch /var/www/html/conf/1.conf
sudo service apache2 restart
