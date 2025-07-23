#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]
then 
    echo "Number is greater than 100"
else
    echo "Given number is less than 100 or equal to 100"
fi
