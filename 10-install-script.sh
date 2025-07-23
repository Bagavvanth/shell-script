#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR: you must have sudo access to execute this script"
    exit 1 #other than zero
fi

dnf install mysqll -y
if [ $? ne 0 ]
   echo "Installing MySql...FAILURE"
   exit1
else
   echo "Installing MySql..SUCCESS"
fi

dnf install git -y