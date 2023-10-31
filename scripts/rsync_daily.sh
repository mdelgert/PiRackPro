#!/bin/bash

# Source and destination directories
source_dir="mdelgert@b1:/mnt/d1/"
destination_dir="/mnt/gfs/rsync/daily"

# Run rsync with options, including --delete
rsync -avz --delete --exclude '/docker' "$source_dir" "$destination_dir"

# Example Crontab Daily backup
#0 2 * * * /home/mdelgert/scripts/rsync_daily.sh