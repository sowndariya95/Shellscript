#!/bin/bash

Root=$(id -u)

if [ $Root -ne 0 ]
then
echo "Execute the command with sudo permission"
exit 1
fi

yum install mysql -y