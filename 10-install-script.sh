#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR: you must have sudo access to execute this script"
    exit 1 #other than zero
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
   echo "Installing MySql...FAILURE"
   exit 1
else
   echo "Installing MySql..SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "Installing Git...Failure"
    exit 1
else
    echo "Installing Git ... Success"
fi