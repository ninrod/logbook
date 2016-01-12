# find all dot files on home directory
ls -la `find ~ -maxdepth=1 -type l`

# show 20 biggest folders from current dir
du -sm * | sort -nr | head -n 20
