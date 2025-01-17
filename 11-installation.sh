#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]
then
    echo "Better use root user for installation tasks..."
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not available. Load up installing git :)"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git install failure... mind checking script"
        exit 1
    else
        echo "Yup... Git installed"
    fi
else
    echo "Git is already there... Thanks!"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "No luck for mysql... preparing to install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Mysql install failure... mind checking script"
        exit 1
    else
        echo "Yup... Mysql installed"
    fi
else
    echo "Mysql is already there... Thanks!"
fi
