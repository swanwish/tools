#!/bin/bash

# Usage
# restart_service.sh fileserver ~/servers -port=8080

serviceBackupDir=.service_backup

if [ -z "$1" ]; then
    echo Please pass the service name
    exit
else
    SERVICE_NAME=$1
fi

if [ ! $2 ]; then
    echo Set service dir as ~/servers
    SERVICE_DIR=~/servers
else
    SERVICE_DIR=$2
fi

if [ ! $3 ]; then
    echo Service param is not specified.
    SERVICE_PARAM=""
    CHECK_SERVICE_NAME="$SERVICE_NAME$"
else
    SERVICE_PARAM="$3"
    CHECK_SERVICE_NAME="$SERVICE_NAME "
fi

pid=`ps -aux | grep "$CHECK_SERVICE_NAME" | grep -v grep | grep -v "$0" | awk '{print $2}'`
if [ ! -z "$pid" ]; then
    echo "Stop service $SERVICE_NAME"
    kill -9 $pid
fi

cd $SERVICE_DIR

ZIP_FILE_NAME=$SERVICE_NAME.tar.gz

if [ -f $ZIP_FILE_NAME ]
    then
        if [ -d $SERVICE_NAME ]
        then
            echo Backup service
              [[ -d $SERVICE_DIR/$serviceBackupDir ]] || mkdir $SERVICE_DIR/$serviceBackupDir
            create_time=`date -r $SERVICE_NAME +"%Y%m%d_%H%M%S"`
            tar czf $serviceBackupDir/"$SERVICE_NAME"_"$create_time".tar.gz $SERVICE_NAME
            rm -rf $SERVICE_NAME
        fi

        echo Extract $ZIP_FILE_NAME
        tar xzf $ZIP_FILE_NAME
        echo Remove $ZIP_FILE_NAME
      rm $ZIP_FILE_NAME
fi

echo Start service $SERVICE_NAME
cd $SERVICE_DIR/$SERVICE_NAME
nohup ./$SERVICE_NAME $SERVICE_PARAM $4 $5>> log_$SERVICE_NAME.log 2>&1 &
