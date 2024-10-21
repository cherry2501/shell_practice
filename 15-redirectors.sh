#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOG_FOLDER

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

USAGE(){
    echo -e "USAGE:: sudo sh 16-redirectors.sh package1 package2 ..."
    exit 1
}

if [ $# -eq 0 ]
then
    USAGE
fi

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then
    echo "Better use root user for installation tasks..."
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is not installed... check your script" | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 installed successfully..." | tee -a $LOG_FILE
    fi
}

for package in $@
do 
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo "$package not installed..." | tee -a $LOG_FILE
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "$package"
    else
        echo "$package is already installed..." | tee -a $LOG_FILE
    fi
done