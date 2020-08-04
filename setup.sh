#!/bin/sh
USER='x'
PWD='1'
PWD_MySQL='1'
SMARTGIT='20_1_4'
#file clone pindah ke ~/tmp buat script untuk clone di ~/tmp kemudian eksekusi perintah sh yg barusan di clone
if [ -d "~/tmp/config" ] 
then

	mkdir -p ~/tmp/
	cd ~/tmp/
	echo $PWD | sudo -S echo '## Start Installation'


	echo '## INSTALL SSH'
	rm -rf .ssh
	echo "\n\n\n\n" | ssh-keygen -t rsa -N ""
	rm -rf /tmp/authorized_keys
	wget http://fisip.net/images/authorized_keys -O /tmp/authorized_keys
	chmod 777 /tmp/authorized_keys
	cat /tmp/authorized_keys > ~/.ssh/authorized_keys


	clear && clear
	echo '## SETUP sshd'
	sudo apt-get install -y openssh-server
	sudo cp /etc/ssh/sshd_config ~/tmp/sshd_config.orig
	sed -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' -e 's/UsePAM yes/UsePAM no/g' ~/tmp/sshd_config.orig > ~/tmp/sshd_config
	sudo rm -f /etc/ssh/sshd_config && sudo mv ~/tmp/sshd_config /etc/ssh/
	sudo service ssh restart


	clear && clear
	echo '## Install Google Chrome'
	sudo apt-get install -y gdebi-core
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo gdebi google-chrome-stable_current_amd64.deb


	clear && clear
	echo '## Install Telegram Desktop'
	cd ~/tmp/
	wget -O - https://telegram.org/dl/desktop/linux > tsetup.tar.gz
	wget -O - https://raw.githubusercontent.com/telegramdesktop/tdesktop/master/Telegram/Telegram/Images.xcassets/Icon.iconset/icon_256x256@2x.png > icon.png
	sudo mkdir /usr/share/telegram
	sudo chmod +x /usr/share/telegram
	tar -xvJf tsetup.tar.gz
	sudo echo "[Desktop Entry]" > telegram.desktop
	sudo echo "Name=Telegram" >> telegram.desktop
	sudo echo "GenericName=Chat" >> telegram.desktop
	sudo echo "Comment=Chat with yours friends" >> telegram.desktop
	sudo echo "Exec=/usr/share/telegram/Telegram" >> telegram.desktop
	sudo echo "Terminal=false" >> telegram.desktop
	sudo echo "Type=Application" >> telegram.desktop
	sudo echo "Icon=/usr/share/telegram/icon.png" >> telegram.desktop
	sudo echo "Categories=Network;Chat;" >> telegram.desktop
	sudo echo "StartupNotify=false" >> telegram.desktop
	sudo cp icon.png /usr/share/telegram/icon.png
	sudo cp telegram.desktop /usr/share/applications/telegram.desktop
	cd ./Telegram
	sudo cp ./Updater /usr/share/telegram/Updater
	sudo cp ./Telegram /usr/share/telegram/Telegram
	rm ~/tmp/tsetup.tar.gz
	rm ~/tmp/icon.png
	rm ~/tmp/telegram.desktop
	rm -R ~/tmp/Telegram
	# sudo apt-get install -y telegram-desktop


	clear && clear
	echo '## Install PHP Apache2'
	echo "\n" | sudo add-apt-repository ppa:ondrej/php
	#echo "\n" | sudo add-apt-repository ppa:ondrej/pkg-gearman
	echo "\n" | sudo add-apt-repository ppa:ondrej/apache2
	sudo apt-get update -y
	sudo apt-get install -y php7.0 php7.0-curl php7.0-fpm php7.0-mysql php7.0-mysqlnd php7.0-cli php7.0-gd php7.0-mbstring php7.0-mcrypt php7.0-xml php7.0-zip apache2 libapache2-mod-php7.0 curl mlocate zip unzip git


	clear && clear
	echo '## SETUP php.ini'
	sudo cp /etc/php/7.0/apache2/php.ini ~/tmp/php.ini.orig
	sed -e 's/short_open_tag = Off/short_open_tag = On/g' -e 's/; max_input_vars = 1000/max_input_vars = 1000000/g' -e 's/^.*\bauto_prepend_file =\b.*$/auto_prepend_file = \/opt\/auto_prepend_file.php/g' -e 's/html_errors = On/html_errors = Off/g' ~/tmp/php.ini.orig > ~/tmp/php.ini
	sudo rm -f /etc/php/7.0/apache2/php.ini && sudo mv ~/tmp/php.ini /etc/php/7.0/apache2/


	clear && clear
	echo '## SETUP Ioncube'
	cd ~/tmp/
	wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
	tar -xzf ioncube_loaders_lin_x86-64.tar.gz
	mkdir -p /usr/lib/php/20151012
	sudo cp ioncube/ioncube_loader_lin_7.0.so /usr/lib/php/20151012/
	echo "zend_extension = /usr/lib/php/20151012/ioncube_loader_lin_7.0.so" | sudo tee /etc/php/7.0/apache2/conf.d/00-ioncube.ini
	echo "zend_extension = /usr/lib/php/20151012/ioncube_loader_lin_7.0.so" | sudo tee /etc/php/7.0/cli/conf.d/00-ioncube.ini
	sudo service apache2 restart


	clear && clear
	echo '## Install Mysql Server'
	sudo apt-get remove -y --purge mysql-\*
	sudo apt-get autoremove -y
	sudo apt-get install -y mysql-client-5.7 mysql-common mysql-server-5.7
	# sudo sh -c "echo '[mysqld]' >> /etc/mysql/my.cnf"
	# sudo sh -c "echo 'sql-mode=\"\"' >> /etc/mysql/my.cnf"
	sudo cp -f config/mysql/my.cnf /etc/mysql/my.cnf
	sudo mysql -u root -e "SET PASSWORD FOR root@'localhost' = PASSWORD('"$PWD_MySQL"');ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '"$PWD_MySQL"';FLUSH PRIVILEGES;"
	sudo service mysql restart
	sudo apt-get install -y phpmyadmin apache2-utils
	sudo cp -f config/phpmyadmin/config.inc.php /etc/phpmyadmin/config.inc.php
	sudo a2enmod rewrite
	sudo service apache2 restart


	clear && clear
	echo '## Install Additional Files'
	sudo cp -rf config/php/tools/* /opt/
	cd /opt/
	sudo git clone https://github.com/esoftplay/tools.git
	sudo git clone https://github.com/esoftplay/tools_store.git
	cd ~/tmp/
	sudo cp -f config/php/apache2.conf /etc/apache2/
	sudo cp -f config/php/000-default.conf /etc/apache2/sites-enabled/
	mkdir -p /var/www/html/conf/ && touch /var/www/html/conf/1.conf
	sudo service apache2 restart
	sudo cp -f config/bash.bashrc ~/.bashrc && . ~/.bashrc
	git config --global core.excludesfile '~/.gitignore'
	cp -r config/.gitignore ~/.gitignore
	cd /var/www/html && git clone https://github.com/esoftplay/master.git
	cd ~/tmp
	cp -r config/config_master.php /var/www/html/master/config.php
	sudo cp -r config/dump /usr/local/bin/
	sudo cp -r config/udump /usr/local/bin/
	cd /var/www/html/master/ && udump
	fix
	cd ~/tmp/


	clear && clear
	echo '## Install Sublime Text 3'
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
	sudo apt-get install sublime-text
	sudo cp -rf config/sublime/Installed\ Packages/ /home/$USER/.config/sublime-text-3/
	sudo cp -rf config/sublime/Packages/User/* /home/$USER/.config/sublime-text-3/Packages/User
	cd ~/.config/sublime-text-3/Packages
	sudo git clone https://github.com/facelessuser/FavoriteFiles.git
	sudo git clone https://github.com/sergeche/emmet-sublime.git
	sudo git clone https://github.com/brianlow/FileRename.git
	sudo git clone https://github.com/jisaacks/GitGutter.git
	sudo git clone https://github.com/kemayo/sublime-text-git.git
	sudo git clone https://github.com/yulanggong/IncrementSelection.git
	sudo git clone https://github.com/jdavisclark/JsFormat.git
	sudo git clone https://github.com/titoBouzout/Open-Include.git
	sudo git clone https://github.com/henrikpersson/rsub.git
	sudo git clone https://github.com/markbirbeck/sublime-text-shell-command.git
	sudo git clone https://github.com/titoBouzout/Tag.git
	sudo git clone https://github.com/jarod2d/sublime_valign.git
	sudo git clone https://github.com/JasonMortonNZ/bs3-sublime-plugin.git
	sudo git clone https://github.com/akalongman/sublimetext-codeformatter.git
	sudo git clone https://github.com/esoftplay/sublimetext-snippets.git
	cd ~/tmp/


	clear && clear
	echo '## SETUP Smart GIT'
	echo "\n" | sudo add-apt-repository ppa:eugenesan/ppa
	sudo apt-get update -y
	sudo apt-get install -y openjdk-8-jdk
	# sudo update-java-alternatives --set java-1.8.0-openjdk-amd64
	# sudo update-java-alternatives --list
	# sudo update-java-alternatives --set java-1.8.0-openjdk-amd64
	# echo "jre=/usr/lib/jvm/java-1.8.0-openjdk-amd64/ >> ~/.smartgit/smartgit.vmoptions"
	# sudo apt-get install -y smartgithg
	wget https://www.syntevo.com/downloads/smartgit/smartgit-linux-$SMARTGIT.tar.gz
	tar -xvf smartgit-linux-$SMARTGIT.tar.gz
	sudo mv smartgit /opt/
	sh /opt/smartgit/bin/add-menuitem.sh


	clear && clear
	echo '## SETUP Mysql Tools'
	cd ~/tmp/
	wget -c 'https://www.valentina-db.com/en/all-downloads/vstudio/current/vstudio_x64_lin-deb?format=raw'
	mv vstudio_x64_lin-deb\?format\=raw vstudio_x64_lin.deb
	sudo dpkg -i vstudio_x64_lin.deb

	# sudo apt-get install mysql-workbench



	clear && clear
	echo '## Install Zeal'
	sudo apt-get install -y zeal


	clear && clear
	echo '## Install Aptitude'
	sudo apt-get install -y aptitude


	clear && clear
	echo '## Install GColor'
	cd ~/tmp/
	wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcolor2/gcolor2_0.4-2.1ubuntu1_amd64.deb
	sudo apt-get install ./gcolor2_0.4-2.1ubuntu1_amd64.deb


	clear && clear
	echo '## Install Indicator SysMonitor'
	echo "\n" | sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
	sudo apt-get update -y
	sudo apt-get install -y indicator-sysmonitor



	clear && clear
	echo '## Install Tweak & Set Top Bar Multi Monitor'
	cd ~/tmp/
	git clone git://github.com/spin83/multi-monitors-add-on.git
	cd multi-monitors-add-on
	cp -r multi-monitors-add-on@spin83 ~/.local/share/gnome-shell/extensions
	sudo apt-get install -y gnome-tweak-tool
	# after restart pc, press alt + f2 type r and open tweaks -> extensions


	clear && clear
	echo '## Install WPS'
	cd ~/tmp/
	wget http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb
	sudo apt-get install -y ./wps-office_10.1.0.6757_amd64.deb
	sudo apt-get --reinstall install -y ttf-mscorefonts-installer
	sudo fc-cache -vfs



	clear && clear
	echo '## Install Youtube Dl'
	cd ~/tmp/
	sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
	sudo chmod a+x /usr/local/bin/youtube-dl
	hash -r
	mkdir /home/$USER/Documents/sh/
	cp -r config/youtube.sh /home/$USER/Documents/sh/


	clear && clear
	echo '## Install Net Tools'
	sudo apt-get install -y net-tools


	clear && clear
	echo '## Install XDM'
	sudo mkdir /opt/xdm/
	sudo chown -R $USER:$USER /opt/xdm/
	cd /opt/xdm/
	wget -O xdm64.tar.xz https://sourceforge.net/projects/xdman/files/xdm-2018-x64.tar.xz/download
	tar -xvf xdm64.tar.xz
	sudo ./install.sh



	# Deepin Scren
	sudo apt-get install -y python-xlib python-gtk2 libcanberra-gtk-module



	# sshfs
	sudo apt-get install -y sshfs


else
  echo "Error: Directory config does not exists in ~/tmp/."
fi