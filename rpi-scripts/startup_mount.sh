#!/bin/sh

DISKS=($(ls /dev | grep "^sd[a-z][0-9]$"))

umount /mnt/*
echo "$(date) Unmounted previous volumes"
# rm -rfv /mnt/*

for i in ${!DISKS[@]}; do
	DISK_LABEL=$(/usr/sbin/e2label "/dev/${DISKS[i]}" | grep -oP "\'\K[^\']+")
	DIR_NAME=/mnt/"$DISK_LABEL"
	echo "$(date) Creating $DIR_NAME"
	
	mkdir -p "$DIR_NAME"
	echo "$(date) Mounting /dev/${DISKS[i]} in $DIR_NAME"
       	
	mount "/dev/${DISKS[i]}" "$DIR_NAME"
done
