# patches
Patch repository for ingenium computers. Whenever you release a new patch, name it "#.sh", where # is the next integer higher than the previous highest patch number. When Ingenium computers boot (though for now, not the G16), they will search this repository and download and run the patches numbered higher than the last number stored in their patch file.

Every patch file released must:
1. Be well documented
2. Be a working bash script, marked by chmod +x as executable _before_ syncing to the GitHub
3. Be approved by the project lead it if it involves a major change.
4. Be reviewed for safety
5. Contain a line of code to alter the ~/.patches file. (This should be a plain text file containing only the integer code of the latest patch that was installed)
