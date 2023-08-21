#!/bin/bash

Root=$(id -u)

if [ $Root -ne 0 ]
then
echo "Execute the command with sudo permission"
exit 1
fi

yum install mysqll -y

if [ $? -ne 0 ]
then 
 echo "Installation is Failure"
else
 echo "Installation is success"
 fi