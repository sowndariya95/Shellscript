#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
DATE=$(date +%F)
Script_Name=$0
Logfile=/tmp/$Script_Name-$DATE.log
Package=("git" "mysql" "postfix" "mailx")

validate(){
    if [ $1 -ne 0 ]
    then 
     echo -e "$R Error : $N Run with root user privelage"
    exit 1
    fi
}

Installation(){
    for i in $Package
    do
      if [ sudo yum list --installed | grep $i -ne 0 ]
      then
        sudo yum install -y $i &>>$Logfile
        echo -e "$G Installation is $i success $N"
      else
        echo -e "$R Package is already exist $N"
     fi
    done
}

User_permission=$(id -u)

validate $? &>>$Logfile





