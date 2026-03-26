#!/bin/bash

#AB Update the patches repo
cd ~/Documents/GitHub/patches
git pull origin main



#AB Configuration
DIRECTORY="$HOME/Documents/GitHub/patches"
LAST_PATCH=$(cat ~/.patches.txt)
GREATER_FILES=()



for file in *.sh; do
    filename=$(basename "$file")
    num="${filename%.sh}"

    #AB Check if the filename is a number and greater than the number of the previous patch
    if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -gt "$LAST_PATCH" ]; then
        GREATER_FILES+=("$filename")
    fi
done

#AB If the length (#) of the array (GREATER_FILES[@]) is 0, then exit. The system is up to date.
if [ ${#GREATER_FILES[@]} -eq 0 ]; then
    exit 0
fi

#AB Sort numerically so 2.sh runs before 10.sh
IFS=$'\n' sorted_files=($(sort -n <<<"${GREATER_FILES[*]}"))
unset IFS


#AB Execute the found patch files in order
for script in "${sorted_files[@]}"; do
    bash "./$script"
    
    # Check if the script failed
    if [ $? -ne 0 ]; then
        echo "Error: $script failed with exit code $?. Stopping sequence."
        exit 1
    fi
done

exit 0
