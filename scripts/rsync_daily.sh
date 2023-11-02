#!/bin/bash

# Enable or disable redirection to log file
redirect_output=true

# Generate a Unix timestamp
timestamp=$(date +"%s")

if [ "$redirect_output" = true ]; then
  # Define log file path
  log_file="logs/rsync_daily_$timestamp.log"

  # Redirect stdout and stderr to the log file
  exec > >(tee -a "$log_file")
  exec 2>&1
fi

# Source and destination directories
source_dir="mdelgert@b1:/mnt/d1/"
destination_dir="/mnt/gfs/rsync/daily"

# Run rsync with options, including --delete
rsync -avz --delete --exclude '/docker' "$source_dir" "$destination_dir"

# Example Crontab Daily backup
#0 2 * * * /home/mdelgert/scripts/rsync_daily.sh