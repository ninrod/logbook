##### print lines that match a criteria
git status --short | awk '$1 == "AA"' {print $0}

##### show all directories including 'dot' directories that are not named .git
print -l ^.git(D/)

##### show all files including 'dot' files that are not named .git
print -l ^.git(D/)

##### tip from http://stackoverflow.com/questions/637827/redirect-stderr-and-stdout-in-a-bash-script
# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-
# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>$LOG_FILE
# Redirect STDERR to STDOUT
exec 2>&1
echo "This line will appear in $LOG_FILE, not 'on screen'"

# find all dot files on home directory
ls -la `find ~ -maxdepth=1 -type l`

# show 20 biggest folders from current dir
du -sm * | sort -nr | head -n 20
