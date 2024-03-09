#!/usr/bin/bash

arg2=8
if [[ $1 == "-n" && $2=~^[0-9]+$ ]]
then
  arg2=$2
  shift 2
sudo du -h $1 | head -$arg2 | sort -hr
elif [[ $1 == "-d" ]]
  then
  shift 1
sudo du -h -all $1 | head -$arg2 | sort -hr
else 
	sudo du -h $1 | head -$arg2 | sort -hr 
fi

