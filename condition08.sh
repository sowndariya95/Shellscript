#!/bin/bash

Root=$(id -u)

if [ Root -ne 0 ]
then
echo "Execute the command with sudo permission"
else
yum install mysql -y
fi