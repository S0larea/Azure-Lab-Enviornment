#/bin/bash

#Make sure to clear your tmp directories before beginning

rm -rf /tmp/*
rm -rf /var/tmp/*

# Clear out any apt updates as well
apt clean -y

# Clear out any thumbnails for the sysadmin, instructor, and student
rm -rf /home/sysadmin.cache/thumbnails
rm -rf /home/instructor.cache/thumbnails
rm -rf /home/student.cache/thumbnails
rm -rf /root/.cache/thumbnails