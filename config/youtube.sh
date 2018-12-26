#!/bin/sh
FILE="$@"
if [ -z "$FILE" ]
then
 read -p "File txt : " FILE
fi
youtube-dl -f 18 -a $FILE