#!/bin/bash

SPECIALVARIABLES 

echo "Name of the script: $0"
echo "Orguments: $1 $2"
echo "All variables: $0"
echo "No 0f variables $#"
echo "pwd: $PWD" 
sleep 60 & 
echo "process id: $$"
echo "process id of last command in background: $$"
echo "process id of current script: $*"