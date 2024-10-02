#!/bin/bash

# File to store the last run time
LAST_RUN_FILE="/home/gdleslie/last_run_time.txt"

# Current time in seconds
CURRENT_TIME=$(date +%s)

# Check if the last run file exists
if [ -f "$LAST_RUN_FILE" ]; then
  # Read the last run time from the file
  LAST_RUN=$(cat "$LAST_RUN_FILE")

  # Calculate the time difference between now and the last run
  TIME_DIFF=$((CURRENT_TIME - LAST_RUN))

  # Check if 24 hours (86400 seconds) have passed
  if [ $TIME_DIFF -lt 86400 ]; then
    echo "The script was already run within the last 24 hours."
    exit 0
  fi
fi

# Update and upgrade system packages
echo "Updating package list and upgrading installed packages..."

# Update package list
sudo apt update -y

# Upgrade packages
sudo apt upgrade -y

echo "System is up to date."

# Save the current time to the last run file
echo $CURRENT_TIME > "$LAST_RUN_FILE"
