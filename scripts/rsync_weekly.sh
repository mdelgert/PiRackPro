#!/bin/bash

# Source and destination directories
source_dir="mdelgert@b1:/mnt/d1/"
destination_dir="/mnt/gfs/rsync/weekly"

# Run rsync with options, including --delete
rsync -avz --delete --exclude '/docker' "$source_dir" "$destination_dir"

# Example Crontab Weekly backup
#0 3 * * 0 /home/mdelgert/scripts/rsync_weekly.sh
