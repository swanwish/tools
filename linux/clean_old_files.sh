#!/bin/bash

check_path="/tmp"

if [ ! -z "$1" ]; then
  check_path=$1
fi

if [ ! -d $check_path ]; then
  echo "The path $check_path is not directory"
  exit
fi

keep_days=3

if [ ! -z "$2" ]; then
	keep_days=$2
fi

echo "Check path $check_path and keep files in $keep_days days"

echo "Remove files $keep_days days ago"
find $check_path -type f -mtime +"$keep_days"d -delete

echo "Remove empty directory"
find $check_path -type d -empty -delete
