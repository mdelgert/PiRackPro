#!/bin/bash

# Source and destination directories
source_dir="mdelgert@b1:/mnt/d1/"
destination_dir="/mnt/gfs/rsync/monthly"

# Run rsync with options, including --delete
rsync -avz --delete --exclude '/docker' "$source_dir" "$destination_dir"

# Example Crontab Monthly backup
#0 4 1 * * /home/mdelgert/scripts/rsync_monthly.sh