#!/bin/bash
LOGSDIR=/tmp
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
data_threshold=1
message=""
disk_usage=$(df -hT | grep -vE "tmpfs|filesystem")
while IFS= read line
do
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1}')
    if [ $usage -gt $data_threshold ]
    then
        message+="High disk usage on $partition:$usage"
    fi
    
done<<<$disk_usage

echo "message is: $message"
