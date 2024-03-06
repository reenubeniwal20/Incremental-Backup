#!/bin/bash
# MySQL credentials
DB_USER="root"
DB_PASS="123ree"
DB_NAME="testdb"
# Backup folder
BACKUP_DIR="/root/sites"
# Get the current date
NOW=$(date +"%d-%m-%Y_%H-%M-%S")
# Incremental backup filename
INCREMENTAL_BACKUP_FILE="$BACKUP_DIR/$DB_NAME-incremental-$NOW.sql"
# Get the timestamp of the last full backup (replace with the actual timestamp)
LAST_FULL_BACKUP_TIMESTAMP="20240305100348" # Example timestamp (replace with your own)
# Create incremental backup (only modified data since last full backup)
mysqldump -u $DB_USER -p$DB_PASS --where="last_modified > FROM_UNIXTIME($LAST_FULL_BACKUP_TIMESTAMP)" $DB_NAME > $INCREMENTAL_BACK>

# Check if incremental backup was successful
if [ $? -eq 0 ]; then
   echo "Incremental backup created successfully: $INCREMENTAL_BACKUP_FILE"
else
   echo "Error creating incremental backup"
   exit 1
fi
