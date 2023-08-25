#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
DATE=$(date +%F)
Script_Name=$0
Logfile=/tmp/$Script_Name-$DATE.log

User_permission=$(id -u)

if [ $User_permission -ne 0 ]
then
  echo "$R Error : $N Run with user privelage"
  exit 1
fi

validate(){
if [$1 -ne 0 ]
then
  echo "$G Installation is Success"
else
  echo "$R Installation is Failure"
fi
}

Package() {
  if [ $1 -ne 0 ]
  then 
    yum install $i -y 
    validate $? $i
else  echo -e "$i $G already installed$N"
    fi
}
for i in $@
do
    yum list installed | grep $i >>$Logfile
    PACKAGE $?
done
