# SETUP Ubuntu LTS

install git in your computer
* `sudo apt install -y git`

clone this in `~/tmp/` put in current dir
* `mkdir -p ~/tmp/ && cd ~/tmp/ && git clone https://github.com/ahmad-syafiq/ubuntu.git .`

run installer
* `sh ~/tmp/install.sh`

notes :
- Configuring mysql-apt-config
	- Add repository to unsupported system?
		select `ubuntu bionic` then `ok`
	- Which MySQL product do you wish to configure?
		select `MySQL Server & Cluster (Currently selected: mysql-8.0)` change to `MySQL Server & Cluster (Currently selected: mysql-5.7)` then `ok`

- Configuring mysql-community-server
	- Enter root password:
	- Re-enter root password:

- Securing the MySQL server development.
	- Enter password for user root:
	- VALIDATE PASSWORD plugin? `N`
	- Change the password for root? `Y`
	- New password:
	- Re-enter new password:
	- Remove anonymous users? `Y`
	- Disallow root login remotely? `Y`
	- Remove test database and access to it? `Y`
	- Reload privilege tables now? `Y`
