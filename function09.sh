#!/bin/bash

Root=$(id -u)

validate(){
    if[ $1 -ne 0 ]
    then
      echo "Installation is failure"
    else
      echo "Installation is success"
    fi
}

if [ $Root -ne 0 ]
then
  echo "Execute the command with sudo permission"
exit 1
fi

yum install mysql -y

validate $?

 yum install postfix -y

validate $?