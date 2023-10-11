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

PASS_SQL="$3"
if [ -z "$PASS_SQL" ]
then
 read -p "Masukkan password MySQL Anda : " PASS_SQL
fi


if [ -d "$HOME/tmp/config" ] 
then
	cd ~/tmp/
	
	echo $PASS | sudo -S echo '## Start Installation'

	sudo apt clean -y && sudo rm -r /var/lib/apt/lists && sudo apt update -y && sudo apt upgrade -y
	sudo cp -f /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
	sudo apt install software-properties-common
	sudo apt install -y plocate

	sudo cp -f config/bash.bashrc ~/.bashrc
	. ~/.bashrc

	. "config/install/ssh.sh"
	. "config/install/sshd.sh"
	. "config/install/sublime.sh"
	. "config/install/apache2.sh"
	. "config/install/mysql57.sh"
	. "config/install/php74.sh"
	. "config/install/phpmyadmin.sh"
	. "config/install/master.sh"

	clear && clear
	echo "All Done.."
else
  echo "Error: Directory config does not exists in ~/tmp/."
fi


