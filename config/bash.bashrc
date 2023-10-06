alias fisip_help='curl -s fisip.net/fw/help|php|sh'
alias ls='ls --color=auto'
alias ll='ls -alF'

alias rs='function res(){ B="$@"; if [ -z "$B" ]; then B="apache2";fi;sudo service "$B" restart;};res'
alias rc='function res(){ B="$@"; if [ -z "$B" ]; then B="";fi;echo deleting "$B"images/cache && sudo rm -rf "$B"images/cache;};res'

alias apt_fix='sudo apt-get clean && sudo rm -r /var/lib/apt/lists && sudo apt-get update'

alias fix='find . \( -path ./images -o -path ./bahan -o -path ./cgi-bin/mobile \) -prune -o -type d -exec chmod 755 {} \; && find . \( -path "./images/*" -o -path "./bahan/*" \) -prune -o -type f -exec chmod 644 {} \; && find templates/. -name style.css -exec chmod 777 {} \; && chmod -R 777 ./images && rm -rf ./images/cache;'

alias lc='function a(){ B="$@"; cd "/var/www/html/$B";};a'






# SERVER ALIAS #
	alias esoftplay='function a(){ B="$@"; if [ -z "$B" ]; then B="root";fi;ssh -R 52692:localhost:52698 "$B"@52.76.122.17;};a'
# SERVER ALIAS #

# GIT ALIAS #
	#alias pull='php ~/Documents/sh/pull|php|sh'
	alias pull='git checkout . && git clean -df && git pull'
	alias pullmaster='cd /var/www/html/master/ && git checkout . && git clean -df && git pull'
	alias pulltools='cd /opt/tools/ && git checkout . && git clean -df && git pull'
	alias remaster='cd /var/www/html/master && git fetch origin master && git reset --hard FETCH_HEAD && git clean -df'
	alias info='git config --get remote.origin.url'
	alias pushmaster='git checkout master && git pull origin master && git merge dev && git push origin master && git checkout dev'
	alias pullfork='function a(){ B="$@"; if [ -z "$B" ]; then B="binary";fi;git checkout . && git clean -df && git pull https://github.com/esoftplay/"$@".git master; };a'
# GIT ALIAS #


# PHP ALIAS #
	alias exportdb='sh ~/Documents/sh/exportdb.sh'
	#alias fix='find . -type f -exec chmod 644 {} \; && find . -type d -exec chmod 755 {} \; && chmod 777 -R images/ && find templates/. -name style.css -exec chmod 777 {} \;'
	#alias fix='find . \( -path "./images/*" -o -path "./bahan/*" \) -prune -o -type d -exec chmod 755 {} \; && find . \( -path "./images/*" -o -path "./bahan/*" \) -prune -o -type f -exec chmod 644 {} \; && find templates/. -name style.css -exec chmod 777 {} \; && chmod -R 777 images && rm -rf images/cache;'
	
	alias gear='function a(){ gearadmin --$@; };a'
	alias gear_start='php /var/www/html/master/includes/class/async.php &'
	alias ip='curl ipinfo.io/ip'
	
	alias php5.5='sudo a2dismod php5.6 && sudo a2dismod php7.0 && sudo a2dismod php7.1 && sudo a2enmod php5 && sudo update-alternatives --set php /usr/bin/php5 && sudo service apache2 restart'
	alias php5.6='sudo a2dismod php7.0 && sudo a2dismod php7.1 && sudo a2enmod php5.6 && sudo update-alternatives --set php /usr/bin/php5.6 && sudo service apache2 restart'
	alias php7.0='sudo a2dismod php5.6 && sudo a2dismod php7.1 && sudo a2enmod php7.0 && sudo update-alternatives --set php /usr/bin/php7.0 && sudo service apache2 restart'
	alias php7.1='sudo a2dismod php5.6 && sudo a2dismod php7.0 && sudo a2enmod php7.1 && sudo update-alternatives --set php /usr/bin/php7.1 && sudo service apache2 restart'
	alias upload='function up(){ cd "/Users/x/Documents/Sync/Upload/$@"; };up'
	alias download='function down(){ cd "/Users/x/Documents/Sync/Download/$@"; };down'
# PHP ALIAS #






alias delmac='find . -name "._*" -exec rm -rf {} \; && find . -name ".DS_Store" -exec rm -rf {} \;'
alias run='php bin/console server:run;'


alias st='function st(){ sudo service $@ stop; };st'
alias dl='sh ~/Documents/sh/youtube.sh'
alias apt_rm='function rm(){ B="$@"; sudo add-apt-repository --remove ppa:"$B"; };rm'
alias ds='du -hs';

alias services='service --status-all'

alias fs='php /home/x/Documents/Documentation/files/sshfs'
alias fs_exit='php /home/x/Documents/Documentation/files/sshfs_exit'

alias rotate='function a(){ B="$@"; if [ -z "$B" ]; then B="normal";fi;xrandr --output LVDS1 --rotate "$B";};a'

