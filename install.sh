#!/bin/sh
USER="$1"
if [ -z "$USER" ]
then
 read -p "Masukkan username ubuntu Anda : " USER
fi

PASS="$2"
if [ -z "$PASS" ]
then
 read -p "Masukkan password ubuntu Anda : " PASS
fi


if [ -d "$HOME/tmp/config" ] 
then
	cd ~/tmp/
	
	echo $PASS | sudo -S echo '## Start Installation'

	source "config/install/install-ssh.sh"
	
	echo "Welcome ${USERNAME}!"
	echo "Your email is ${EMAIL}."
	

else
  echo "Error: Directory config does not exists in ~/tmp/."
fi


