#!/bin/bash
# bin_path="`dirname \"$0\"`"

db_backup_path=~/db_backup

# Check configuration file
if [ -z "$1" ]; then
	echo "  Please pass the configuration file
  Usage: backup_db.sh db.conf
  You should export db_name, db_pwd, db_backup_path, backup_dbs
  Note: The backup_dbs like \"db_a,db_b,db_c\"
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
	echo 'Export db_user and db_pwd and db_backup_path in the file'
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

backup() {
	if [ -z "$1" ]; then
    echo "-Parameter database is empty, please input the db name to backup"
  else
    echo "Backup database $1"
    mysqldump -u$db_user -p$db_pwd $1 | grep -v 'SQL SECURITY DEFINER' > $1.sql
  fi
}

assertNotNull "db_user" $db_user
assertNotNull "backup_dbs" $backup_dbs

[[ -d $db_backup_path ]] || mkdir -p $db_backup_path
cd $db_backup_path

today=`date +"%Y%m%d"`
[[ -d $today ]] || mkdir $today
cd $today

now=`date +"%H%M%S"`
echo Create directory $now
[[ -d $now ]] || mkdir $now
cd $now

dbs=$(echo $backup_dbs | tr ",", "\n")

for db in $dbs; do
  backup $db
done

echo "Create tar file from backup folder"
cd ..
tar czf $now.tar.gz $now

echo "Remove backup folder"
rm -rf $now