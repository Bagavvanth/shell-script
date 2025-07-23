#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR: you must have sudo access to execute this script"
    exit 1 #other than zero
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "Installing MySql... FAILURE"
        exit 1
    else 
        echo "Installing MySql.. SUCCESS"
     fi   
else 
    echo "MySql is already.. INSTALLED"
fi       

# if [ $? -ne 0 ]
# then 
#    echo "Installing MySql...FAILURE"
#    exit 1
# else
#    echo "Installing MySql..SUCCESS"
# fi

dnf list installed Git
    
if [ $? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Installing Git... FAILURE"
        exit 1
     else 
         echo "Installing Git.. SUCCESS"
     fi 
else
    echo "Git is already .. INSTALLED"
fi           

# if [ $? -ne 0 ]
# then 
#     echo "Installing Git...Failure"
#     exit 1
# else
#     echo "Installing Git ... Success"
# fi