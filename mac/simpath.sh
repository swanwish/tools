#!/bin/bash

set -e

confPath="~/simpath.conf"

path=""
while read line; do
    parts=(`echo $line | tr "=" " "`)
    if [ "${#parts[@]}" = "2" ]; then
        if [ "$1" = "${parts[0]}" ]; then
            echo "Navigate to ${parts[0]} with bundle ${parts[1]}"
            path=`xcrun simctl get_app_container booted ${parts[1]} data`
        fi
    fi
done < $confPath

if [ ! "$path" = "" ]; then
    cd $path
    $SHELL
else
    echo "Path for app $1 not found, supports apps are list below:"
    while read line; do
        parts=(`echo $line | tr "=" " "`)
        if [ "${#parts[@]}" = "2" ]; then
            echo "- ${parts[0]} (${parts[1]})"
        fi
    done < $confPath
fi
