#!/bin/sh

clear && clear
echo '## SETUP sshd'
sudo apt-get install -y openssh-server
sudo cp /etc/ssh/sshd_config ~/tmp/sshd_config.orig
sed -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' -e 's/UsePAM yes/UsePAM no/g' ~/tmp/sshd_config.orig > ~/tmp/sshd_config
sudo rm -f /etc/ssh/sshd_config && sudo mv ~/tmp/sshd_config /etc/ssh/
rm -f ~/tmp/sshd_config.orig
sudo service ssh restart
