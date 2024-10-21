#!/bin/bash

USERID=(id -u)
if [ $? -ne 0]
then
    echo "Root user is required to run this script..."
fi

for $package in $@
do 
    dnf list installed $package
    VALIDATE $? $package
done

VALIDATE(){
    if [ $1 -ne 0]
    then 
        echo "$2 is not installed..."
    fi
}