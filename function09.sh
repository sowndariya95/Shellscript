#!/bin/bash

DATE=$(date +%F)
Script_name=$0
Logfile=/tmp/$Script_name-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

validate(){
    
if [ $1 -ne 0 ]
    then
      echo -e "Installation is $R failure $N"
      exit 1
    else
      echo -e "Installation is $G success $N"
fi
}

Root=$(id -u) &>>$Logfile

if [ $Root -ne 0 ]
then
  echo "Execute the command with sudo permission"
exit 1
fi

yum install mysql -y &>>$Logfile

validate $? "Installing My sql"

 yum install postfix -y &>>$Logfile

validate $? "Installing Postfix"