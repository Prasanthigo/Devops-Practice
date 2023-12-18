#!/bin/bash
LOGSDIR=/tmp
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
data_threshold=1
disk_usage=$(df -hT | grep -vE "tmpfs|filesystem")
while IFS=read line
do
    usage=$(echo $line | awk '(print $6)' | cut -d % -f1)
    if [ $usage -gt $data_threshold]
    then
        echo "Higher disk usage"
    fi