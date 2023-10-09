#!/bin/sh
PHPMYADMIN='5.2.1'

clear && clear
echo '## INSTALL PHPMYADMIN'
cd ~/tmp/

wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-$PHPMYADMIN-all-languages.zip

unzip phpMyAdmin-$PHPMYADMIN-all-languages.zip

sudo mv phpMyAdmin-$PHPMYADMIN-all-languages /usr/share/phpmyadmin

ln -s /usr/share/phpmyadmin /var/www/html

sed -e 's/$cfg\['\''Servers'\''\]\[$i\]\['\''auth_type'\''\] = '\''cookie'\'';/$cfg\['\''Servers'\''\]\[$i\]\['\''auth_type'\''\] = '\''config'\'';\n$cfg\['\''Servers'\''\]\[$i\]\['\''username'\''\] = '\''root'\'';\n$cfg\['\''Servers'\''\]\[$i\]\['\''password'\''\] = '\'''$PASS_SQL''\'';\n/g' -e 's/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\] = false;/$cfg\['\''Servers'\''\]\[$i\]\['\''AllowNoPassword'\''\] = true;/g' /usr/share/phpmyadmin/config.sample.inc.php > /usr/share/phpmyadmin/config.inc.php

