#!/bin/bash
LOGSDIR=/tmp
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
data_threshold=1
disk_usage=$(df -hT | grep -vE "tmpfs|filesystem")
while IFS=read line
do
    usage=awk(print $6)
    if [ $usage -gt $data_threshold]
    then
        echo "Higher disk usage"
    fi