#/bin/bash

#Create /var/backup
mkdir -p /var/backup

#Create new /var/backup/home.tar
tar cvf /var/backup/home.tar /home

# Move `/var/backup/home.tar` to `/var/backup/home.MMDDYYYY.tar`
mv /var/backup/home.tar /var/backup/home.01012020.tar

# Creates an archive of `/home` to `/var/backup/home.tar`
tar cvf /var/backup/system.tar /home

#List all files in `/var/backup`
ls -lh /var/backup > /var/backup/file_report.text

#Print how much free memory your machine has left.
free -h > /var/backup/disk_report.txt