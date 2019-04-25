#!/bin/bash

# =======================================
#
# Backups

# Get list of devices in /media/patrick
DEVICES="$(find /media/patrick/ -mindepth 1 -maxdepth 1 ! -path . -type d)"
# DEVICES=`find /media/patrick/ -mindepth 1 -maxdepth 1 ! -path . -type d`
echo "${DEVICES}"

# Get # of devices in /media/patrick
NUM_DEVICES="$(echo "${DEVICES}" | wc -l)"
echo $NUM_DEVICES

# Make sure only one device in /media/patrick
# (this is assumed to be the USB flash drive)
if [ $NUM_DEVICES -eq 0 ]
then
	echo "No USB devices attached"
    exit 1
elif [ $NUM_DEVICES -gt 1 ]
then
	echo "More than 1 device is attached"
    exit 2
else
	echo "1 USB device is attached"
    echo "${DEVICES}"
fi

# Change directory to the "USB" device
cd "${DEVICES}"
ls -al

# Get current date for backup directory name on 
DATE="$(date +"%Y%m%d")"
echo $DATE

BACKUP_TARGET="${DEVICES}/DataBackup/msigl62m/$DATE/ubuntu"
echo $BACKUP_TARGET

sudo mkdir -p "${BACKUP_TARGET}"
cp -v -r /home/patrick/Desktop/working "${BACKUP_TARGET}"

