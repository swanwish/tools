#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo 'Please run the script as root'
    exit
fi

SERVICE_SCRIPT='[Unit]
Description=Live Syncing (Mirror) Daemon
After=network.target

[Service]
Type=simple
EnvironmentFile=-/etc/sysconfig/lsyncd
ExecStart=/usr/bin/lsyncd -nodaemon $LSYNCD_OPTIONS

[Install]
WantedBy=multi-user.target'

wget https://github.com/swanwish/tools/raw/master/linux/lsyncd-2.2.3.tar.gz
tar xzf lsyncd-2.2.3.tar.gz
mv lsyncd-2.2.3/lsyncd /usr/bin/
mv lsyncd-2.2.3/lsyncd.sysconfig /etc/sysconfig/lsyncd
mv lsyncd-2.2.3/lsyncd.conf /etc/
rm -rf lsyncd-2.2.3*
echo "$SERVICE_SCRIPT" > /usr/lib/systemd/system/lsyncd.service
systemctl enable lsyncd
