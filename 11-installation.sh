#!/bin/bash

dnf list installed git

if[ $? -ne 0 ]
then
    dnf install git -y
    if[ $? -ne 0 ]
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

if[ $? -ne 0 ]
then
    dnf install mysql -y
    if[ $? -ne 0 ]
    then
        echo "Mysql install failure... mind checking script"
        exit 1
    else
        echo "Yup... Mysql installed"
    fi
else
    echo "Mysql is already there... Thanks!"
fi
