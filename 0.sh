#!/bin/bash

#AB Set up patches.txt file
cd ~
touch .patches.txt
echo "0" >> .patches.txt

#AB Clone the patches repository
cd ~/Documents/GitHub
git clone https://github.com/Ingenium-LiDAR/patches.git

