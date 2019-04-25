#!/bin/bash

# ==================================================================
#
# Backups my data directory to a USB data device (e.g., flash drive)
#
#       - written for my Ubuntu 18.04 system
#       - expects only one device in /media/patrick
#         and assumes it is a USB data device that 
#         can be the backup target
#
# ==================================================================

# Get list of devices in /media/patrick
DEVICES="$(find /media/patrick/ -mindepth 1 -maxdepth 1 ! -path . -type d)"
echo "${DEVICES}"

# Get # of devices in /media/patrick
NUM_DEVICES="$(echo "${DEVICES}" | wc -l)"
echo $NUM_DEVICES

# Make sure there is only one device in /media/patrick
# (this is assumed to be the backup target USB data device)
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
    echo "assuming is the backup target"
fi

# Get current date for backup directory name on the target device 
DATE="$(date +"%Y%m%d")"
echo $DATE

# Build up backup target path string
BACKUP_TARGET="${DEVICES}/DataBackup/msigl62m/$DATE/ubuntu"
echo $BACKUP_TARGET

# Create backup target direct directory
# and do the backup
sudo mkdir -p "${BACKUP_TARGET}"  # assumes haven't done a backup before on $DATE
cp -v -r /home/patrick/Desktop/working "${BACKUP_TARGET}"

