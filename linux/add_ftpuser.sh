#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
  echo 'Please run the script as root'
  exit
fi

if [ "$1" != "" ]; then
  useradd $1
  su $1 -c "mkdir -p ~/ftp/upload"
  su $1 -c "chmod 550 ~/ftp"
  su $1 -c "chmod 750 ~/ftp/upload"

  echo "$1" >> /etc/vsftpd/user_list
  usermod $1 -s /bin/ftponly

  echo "User $1 created, please set the password"
else
  echo "The username is not specified"
fi
