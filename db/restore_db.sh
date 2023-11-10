#!/bin/bash

# Check configuration file
if [ -z "$1" ]; then
  echo "  Please pass the configuration file
  Usage: restore_db.sh db.conf
  You should export db_name, db_pwd, db_backup_path, dbs
  Note: The dbs like \"db_a,db_b,db_c\"
  "
  exit
else
  confFileName=$1
fi

if [ -f $confFileName ]; then
  . $confFileName
#elif [ -f $bin_path/$confFileName ]; then
#  . $bin_path/$confFileName
else
  echo "Failed to find file $confFileName"
  echo 'Please create $confFileName file'
  echo 'Export db_login_path and dbs in the file'
  exit
fi

assertNotNull() {
  if [ -z "$1" ]; then
    echo "Invalid parameter, please call \"assertNotNull field value\""
    exit
  fi
  if [ -z "$2" ]; then
    echo "$1 value is empty"
    exit
  fi
}

restore() {
  if [ -z "$1" ]
    then
      echo "-Parameter database is empty, please input the db name to backup"
    else
    if [ ! -f $1.sql ]
    then
      echo "File $1.sql not exists"
    else
      echo "Restore database $1 from `date +"%Y-%m-%d %H:%M:%S"`"
      mysql --login-path=$db_login_path $1 < $1.sql
      echo "End Restore database $1 at `date +"%Y-%m-%d %H:%M:%S"`"
    fi
    fi
}

assertNotNull "db_login_path" $db_login_path
assertNotNull "dbs" $dbs

dbs=$(echo $dbs | tr ",", "\n")

for db in $dbs; do
  restore $db
done

echo "Done"
