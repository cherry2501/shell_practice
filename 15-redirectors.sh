#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME/$TIME_STAMP"

mkdir -p $LOG_FILE

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
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "$package not installed..." | tee -a $LOG_FILE
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo "$package is already installed..." | tee -a $LOG_FILE
    fi
done