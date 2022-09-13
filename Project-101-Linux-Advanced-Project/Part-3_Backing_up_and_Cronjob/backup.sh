#!/bin/bash

# Check if we are root privilage or not

if [[ $EUID -ne 0 ]]; then
   echo "Bu script root olarak çalıştırılabilir." 
   exit 1
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file

backup_files="/home/ec2-user/data /etc /boot /usr"

# Where do we backup to. Please crete this file before execute this script

backup_dest="/mnt/backup"

# Create archive filename based on time

date=$(date +%d%b%Y-%H-%M)
archive_file="$HOSTNAME-$date.tgz"

# Print start status message.

echo "$backup_files dosyalarının $backup_dest klasörüne yedeklemesi başlıyor."
date
echo

# Backup the files using tar.

tar czf $backup_dest/$archive_file $backup_files

# Print end status message.

echo
echo "Yedekleme tamamlandı."
date

# Long listing of files in $dest to check file sizes.

ls -lh $backup_dest

#crontab -e 
# */5 * * * * cd file_path && sudo ./backup.sh