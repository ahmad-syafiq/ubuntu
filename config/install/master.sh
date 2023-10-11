#!/bin/sh

clear && clear
echo '## INSTALL MASTER'
cd /var/www/html && git clone https://github.com/esoftplay/master.git

cd ~/tmp
sed -e 's/'\''PASSWORD'\'' => '\''1'\'',/'\''PASSWORD'\'' => '\'''$PASS_SQL''\'',/g' config/config_master.php > config/config.php
mv -f config/config.php /var/www/html/master/config.php

git config --global core.excludesfile '~/.gitignore'
cp -r config/.gitignore ~/.gitignore

sudo cp -rf config/php/tools/* /opt/

cd /opt/
sudo git clone https://github.com/esoftplay/tools.git

cd /var/www/html/master/ && udump
. ~/.bashrc
fix

cd ~/tmp/
mkdir -p /usr/lib/php/20190902
sudo cp config/php/ioncube_loader_lin_7.4.so /usr/lib/php/20190902/
echo "zend_extension = /usr/lib/php/20190902/ioncube_loader_lin_7.4.so" | sudo tee /etc/php/7.4/apache2/conf.d/00-ioncube.ini
echo "zend_extension = /usr/lib/php/20190902/ioncube_loader_lin_7.4.so" | sudo tee /etc/php/7.4/cli/conf.d/00-ioncube.ini
sudo service apache2 restart

