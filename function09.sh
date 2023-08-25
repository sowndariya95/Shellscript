#!/bin/bash

DATE=$(date +%F)
Script_name=$0
Logfile=/tmp/$Script_name-$DATE.log



validate(){
    
if [ $1 -ne 0 ]
    then
      echo "Installation is failure"
      exit 1
    else
      echo "Installation is success"
fi
}

Root=$(id -u) &>>$Logfile

if [ $Root -ne 0 ]
then
  echo "Execute the command with sudo permission"
exit 1
fi

yum install mysql -y &>>$Logfile

validate $?

 yum install postfix -y &>>$Logfile

validate $?