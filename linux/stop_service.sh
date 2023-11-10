#!/bin/bash

SIGNAL=${SIGNAL:-TERM}
PIDS=$(ps ax | grep -i "$1" | grep -v "$0" | grep -v grep | awk '{print $1}')

if [ -z "$PIDS" ]; then
  echo "No service with name $1 to stop"
  exit 1
else
  echo "Kill $PIDS"
  kill -s $SIGNAL $PIDS
fi
