#!/bin/bash

# Update and upgrade system packages
echo "Updating package list and upgrading installed packages..."

# Update package list
sudo apt update -y

# Upgrade packages
sudo apt upgrade -y

echo "System is up to date."
