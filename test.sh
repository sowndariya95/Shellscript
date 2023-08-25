#!/bin/bash

Package=("git" "mysql" "postfix" "mailx")

for i in ${Package[@]}
do
  if [ sudo yum list --installed | grep $i -ne 0 ]
  then
    sudo yum install -y $i 
  else 
   echo -e "$R Package is already exist $N"
  fi
done
