#!/bin/bash

echo 'find all files in /bin. /sbin, /usr/bin, and /usr/sbin that are setuid and owned by root.'
read -p "Hit any key to continue."
find /bin /sbin /usr/bin /usr/sbin -perm -4000 -user root -type f
read -p "Hit any key to continue."

echo 'find all files across the entire system that have setuid or setgid enabled'
read -p "Hit any key to continue."
find / -perm -4000 -o -perm -2000 -type f
read -p "Hit any key to continue."

echo 'find all files in /var that have changed in the last 20 minutes'
read -p "Hit any key to continue."
find /var -mmin -20 -type f
read -p "Hit any key to continue."

echo 'find all files in /var that are regular files of zero length.'
read -p "Hit any key to continue."
find /var -size 0 -type f
read -p "Hit any key to continue."

echo 'find all files in /dev that are not regular files and also not directories. Print a listing that includes permissions and modification times for these files.'
read -p "Hit any key to continue."
#find /dev -type b -o -type c -o -type p -o -type l -o -type s -printf "%M %p"
ls -lah $(find /dev -type b -o -type c -o -type p -o -type l -o -type s)
read -p "Hit any key to continue."

echo 'find all directories in /home that are not owned by root. Change their permissions to ensure they have 711 permissions.'
read -p "Hit any key to continue"
find /home -type d ! -user root -exec chmod 711 {} \;
read -p "Hit any key to continue."

echo 'find all regular files in /home that are not owned by root. Change their permissions to ensure that they have 755 permissions.'
read -p "Hit any key to continue."
find /home -type f ! -user root -exec chmod 755 {} \;
read -p "Hit any key to continue."

echo 'find all files (of all types) in /etc that have changed in the last 5 days.'
read -p "Hit any key to continue."
find /etc -mmin 7200
