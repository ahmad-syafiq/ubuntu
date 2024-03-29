#!/bin/sh

clear && clear
echo '## Install PHP'

echo "\n" | sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install -y php7.4
sudo apt-get install -y php7.4-cli php7.4-common php7.4-curl php7.4-zip php7.4-gd php7.4-mysql php7.4-mysqli php7.4-mysqlnd php7.4-pdo-mysql php7.4-xml php7.4-mbstring php7.4-json php7.4-intl

sudo cp /etc/php/7.4/apache2/php.ini ~/tmp/php.ini.orig
sed -e 's/short_open_tag = Off/short_open_tag = On/g' -e 's/; max_input_vars = 1000/max_input_vars = 1000000/g' -e 's/^.*\bauto_prepend_file =\b.*$/auto_prepend_file = \/opt\/auto_prepend_file.php/g' -e 's/html_errors = On/html_errors = Off/g' ~/tmp/php.ini.orig > ~/tmp/php.ini
sudo rm -f /etc/php/7.4/apache2/php.ini && sudo mv ~/tmp/php.ini /etc/php/7.4/apache2/
rm -f ~/tmp/php.ini.orig
