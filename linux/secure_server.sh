#!/bin/bash

link_file_dev_null() {
	if [ -z "$1" ]; then
		echo "-Parameter file is empty, please input the file path to link with /dev/null"
	else
		echo "Link file $1 to /dev/null"
		[ -e $1 ] && rm $1
		ln -s /dev/null $1
	fi
}

link_file_dev_null ~/.bash_history
link_file_dev_null ~/.mysql_history
link_file_dev_null ~/.psql_history
link_file_dev_null ~/.sqlite_history
