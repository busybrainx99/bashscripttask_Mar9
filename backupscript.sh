#!/usr/bin/bash
#You need to create a backup directory you would be pushing your .tar backup to. Simply run mkdir backup( or which ever name you prefer your backup directory to be).
if [ $# -ne 2 ]
then
      echo "Usage: backup.sh <source_directory> <destination_directory>"
      echo "please try again."
      exit 1
fi

if ! command -v rsync > /dev/null 2>&1
then
      echo "This script requires rsync to be installed."
      echo "please use your distrubution's package manager to install it and try again."
      exit 2
fi


current_date=$(date +%T_%Y-%m-%d)


rsync_options="-av --delete"


$(which rsync) $rsync_options $1  $2/$current_date.backup >> backup_$current_date.log

if [ $? -eq 0 ]
then
    tar -cf $2/$current_date.backup.tar $2/$current_date.backup && rm -r $2/$current_date.backup
fi
