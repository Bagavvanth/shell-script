#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R FAILURE"
        exit 1
    else 
        echo "$2.. $G SUCCESS"
     fi   
     }

if [ $USERID -ne 0 ]
then 
    echo "ERROR: you must have sudo access to execute this script"
    exit 1 #other than zero
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing MySql"
    
else 
    echo -e "MySql is already..$Y INSTALLED"
fi       

dnf list installed Git
    
if [ $? -ne 0 ]
then 
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already ..$Y INSTALLED"
fi           

