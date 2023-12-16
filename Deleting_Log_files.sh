APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.logs" -type f -mtime +14)
echo "$FILES_TO_DELETE"
while readline
do
    echo "deleting $line" &>> $LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE
