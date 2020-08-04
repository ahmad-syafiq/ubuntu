# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi


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


# REACT ALIAS #
	alias build='function a(){ B="$@"; if [ -z "$B" ]; then B="android";fi;exp build:"$B";};a'
	#alias react-native='function a(){ B="$@"; if [ -z "$B" ]; then B="test";fi;create-react-native-app "$B";};a'
	alias watchman_reset='echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches && echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events && echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances && watchman shutdown-server'
	alias wfix='echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p && echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p && echo fs.inotify.max_queued_events=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p && watchman watch-del-all && npm start -- --reset-cache'
# REACT ALIAS #

# PHP ALIAS #
	alias exportdb='sh ~/Documents/sh/exportdb.sh'
	#alias fix='find . -type f -exec chmod 644 {} \; && find . -type d -exec chmod 755 {} \; && chmod 777 -R images/ && find templates/. -name style.css -exec chmod 777 {} \;'
	#alias fix='find . \( -path "./images/*" -o -path "./bahan/*" \) -prune -o -type d -exec chmod 755 {} \; && find . \( -path "./images/*" -o -path "./bahan/*" \) -prune -o -type f -exec chmod 644 {} \; && find templates/. -name style.css -exec chmod 777 {} \; && chmod -R 777 images && rm -rf images/cache;'
	alias fix='find . \( -path ./images -o -path ./bahan -o -path ./cgi-bin/mobile \) -prune -o -type d -exec chmod 755 {} \; && find . \( -path "./images/*" -o -path "./bahan/*" \) -prune -o -type f -exec chmod 644 {} \; && find templates/. -name style.css -exec chmod 777 {} \; && chmod -R 777 ./images && rm -rf ./images/cache;'
	alias gear='function a(){ gearadmin --$@; };a'
	alias gear_start='php /var/www/html/master/includes/class/async.php &'
	alias ip='curl ipinfo.io/ip'
	alias lc='function a(){ 
							B="$@"; 
							if [ "$B" = "master" ]; 
								then cd "/var/www/html/"; 
							else 
								cd "/Users/x/Sites/$B"; 
							fi;};a'
	alias php5.5='sudo a2dismod php5.6 && sudo a2dismod php7.0 && sudo a2dismod php7.1 && sudo a2enmod php5 && sudo update-alternatives --set php /usr/bin/php5 && sudo service apache2 restart'
	alias php5.6='sudo a2dismod php7.0 && sudo a2dismod php7.1 && sudo a2enmod php5.6 && sudo update-alternatives --set php /usr/bin/php5.6 && sudo service apache2 restart'
	alias php7.0='sudo a2dismod php5.6 && sudo a2dismod php7.1 && sudo a2enmod php7.0 && sudo update-alternatives --set php /usr/bin/php7.0 && sudo service apache2 restart'
	alias php7.1='sudo a2dismod php5.6 && sudo a2dismod php7.0 && sudo a2enmod php7.1 && sudo update-alternatives --set php /usr/bin/php7.1 && sudo service apache2 restart'
	alias upload='function up(){ cd "/Users/x/Documents/Sync/Upload/$@"; };up'
	alias download='function down(){ cd "/Users/x/Documents/Sync/Download/$@"; };down'
# PHP ALIAS #



alias fisip_help='curl -s fisip.net/fw/help|php|sh'

alias apt_fix='sudo apt-get clean && sudo rm -r /var/lib/apt/lists && sudo apt-get update'
alias delmac='find . -name "._*" -exec rm -rf {} \; && find . -name ".DS_Store" -exec rm -rf {} \;'
alias run='php bin/console server:run;'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias rf='pkill -f firefox && firefox &! disown'
alias rs='function res(){ B="$@"; if [ -z "$B" ]; then B="apache2";fi;sudo service "$B" restart;};res'
alias rc='function res(){ B="$@"; if [ -z "$B" ]; then B="";fi;echo deleting "$B"images/cache && sudo rm -rf "$B"images/cache;};res'
alias st='function st(){ sudo service $@ stop; };st'
alias dl='sh ~/Documents/sh/youtube.sh'
alias apt_rm='function rm(){ B="$@"; sudo add-apt-repository --remove ppa:"$B"; };rm'
alias ds='du -hs';

alias services='service --status-all'

alias fs='php /home/x/Documents/Documentation/files/sshfs'
alias fs_exit='php /home/x/Documents/Documentation/files/sshfs_exit'

alias rotate='function a(){ B="$@"; if [ -z "$B" ]; then B="normal";fi;xrandr --output LVDS1 --rotate "$B";};a'





# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi
