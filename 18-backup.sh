#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R Usage:: $N sh 18-backup.sh .... <source_dir>, <destination_dir>, <days>)"
    exit 1 
}
if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then 
    echo "Source directory deos not exists... check it!"
fi

if [ ! -d $DESTINATION_DIR ]
then 
    echo "destination directory deos not exists... check it!"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS)
echo "Files: $FILES"

if [ ! -z $FILES ] #true if FILES is empty, ! nakes it expression false
then
    echo "Files are found"
else
    echo "No Files older than $DAYS days"
fi