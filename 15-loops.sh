#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_NAME=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_NAME/$TIMESTAMP.log"

VALIDATE(){
    
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R FAILURE $N"
        exit 1
    else 
        echo -e "$2.. $G SUCCESS $N"
     fi   
     }
 echo "Script started executing at: $TIMESTAMP" #&>>$LOG_FILE_NAME 

if [ $USERID -ne 0 ]
then 
    echo "ERROR: you must have sudo access to execute this script"
    exit 1 #other than zero
fi

dnf list installed mysql  #&>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then 
    dnf install mysql -y  #&>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySql"
    
else 
    echo -e "MySql is already..$Y INSTALLED $N"
fi       

dnf list installed Git  #&>>$LOG_FILE_NAME
    
if [ $? -ne 0 ]
then 
    dnf install git -y # &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already ..$Y INSTALLED $N"
fi           

for package in $@
do 
   dnf list installed $package #&>>LOG_FILE_NAME
   if [ $? -ne 0 ]
   then 
       dnf install $package -y #&>>LOG_FILE_NAME
       VALIDATE $? "Installing $package"
    else 
        echo "$package is already $Y ..Installed $N"
    fi    
done