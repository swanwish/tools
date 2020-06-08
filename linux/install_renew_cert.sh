#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo 'Please run the script as root'
    exit
fi

SCRIPTS='#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

PATH=/sbin:/bin:/usr/sbin:/usr/bin

CERTBOT_EXEC=certbot
if [[ ! -x $CERTBOT_EXEC ]]; then
    if [[ -x /usr/local/bin/certbot-auto ]]; then
        echo "Use certbot-auto"
        CERTBOT_EXEC=/usr/local/bin/certbot-auto
    else
        echo "$CERTBOT_EXEC not exists"
    fi
fi

nohup $CERTBOT_EXEC renew >> /var/log/certbot_renew.log 2>&1 &'

DEST_FILE=/usr/local/bin/renew_cert.sh

function install {
    if [ ! -f $DEST_FILE ]
    then
        echo Install $DEST_FILE
        echo "$SCRIPTS" > $DEST_FILE
        chmod +x $DEST_FILE
    else
        echo The file $DEST_FILE already exists
    fi
    help
}

function help {
    echo 'The renew_cert.sh is installed, you can add a crontab task to run it.

This is the sample crontab script:
0 0,12 * * * /usr/local/bin/renew_cert.sh
'
}

install
