#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Root user is required to run this script..."
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is not installed... check your script"
        exit 1
    else
        echo "$2 installed successfully..."
    fi
}

for package in $@
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "$package not installed..."
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed..."
    fi
done

