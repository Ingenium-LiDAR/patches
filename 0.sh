#!/bin/bash

#AB Set up patches.txt file
cd ~
touch .patches.txt
echo "0" >> .patches.txt


cd ~/Documents/GitHub
git clone https://github.com/Ingenium-LiDAR/patches.git

# Define paths

SECURE_SCRIPT="/usr/local/bin/get_new_patches.sh"

#AB Move the initially downloaded version to a secure location where git can't update it
sudo cp "$HOME/Documents/GitHub/patches/get_new_patches.sh" "$SECURE_SCRIPT"


sudo chown root:root "$SECURE_SCRIPT" #AB Change the ownership to root, so that only the root user can modify it.
sudo chmod 755 "$SECURE_SCRIPT" #AB Set permissions to 755, which allows everyone to read and execute the script, but only the owner (that is, root) can write to it. 
#AB the practical effect of this is that trying to modify the get_new_patches.sh script will prompt sudo.

#AB Create a file in /etc/sudoers.d/ 
#AB This file contains a single line that allows the system to execute the get_new_patches.sh script with sudo without needing to enter a password.
echo "lidar ALL=(ALL) NOPASSWD: $SECURE_SCRIPT" | sudo EDITOR='tee -a' visudo -f /etc/sudoers.d/update-script

#AB Add a command to run the secure copy of get_new_patches.sh to .profile, which runs once on login
echo -e "\n#AB batch script to automatically seek and install patches" >> ~/.profile
echo "sudo $SECURE_SCRIPT &" >> ~/.profile