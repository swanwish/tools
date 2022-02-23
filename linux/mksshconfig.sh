#!/bin/bash

DIR=~/.ssh
FILE=$DIR/config

[ -d $DIR ] || mkdir $DIR && chmod 700 $DIR
[ -f $FILE ] || touch $FILE && chmod 600 $FILE
