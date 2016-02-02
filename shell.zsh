##############################################################################
##############################################################################
##                                                                          ##
##                               GLOBBING                                   ##
##                                                                          ##
##############################################################################
##############################################################################
# more tips can be found on: http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/

##### show all directories including 'dot' directories that are not named .git
print -l ^.git(D/)

##### show all files including 'dot' files that are not named .git
print -l ^.git(D.)

# there are glob qualifiers and string modifiers. they are different.
# this is an example of a modifier
print file.txt(:a)

#example of a glob qualifier and a glob modifier together. the modifier is separated by a colon ':'.
# here we print the full qualified name of all files, including dotfiles (not directories) that are not '.git'.
print ^(.git*)(D.:a)

# removing all directories except some
rm -rf ^(vim-colors-solarized|vim-airline)



##############################################################################
##############################################################################
##                                                                          ##
##                          FILE MANIPULATION                               ##
##                                                                          ##
##############################################################################
##############################################################################

# find all dot files on home directory
ls -la `find ~ -maxdepth=1 -type l`

# show 20 biggest folders from current dir
du -sm * | sort -nr | head -n 20




##############################################################################
##############################################################################
##                                                                          ##
##                          SED MAGIC                                       ##
##                                                                          ##
##############################################################################
##############################################################################

# show only the deleted and not staged directories in the current branch/repo.
# the regex is striping everything from the first '/' to the end of the filename.
git ls-files -d | sed 's/\/.*$//g' | sort | uniq


##############################################################################
##############################################################################
##                                                                          ##
##                          AWK MAGIC                                       ##
##                                                                          ##
##############################################################################
##############################################################################

# print lines that match a criteria
git status --short | awk '$1 == "AA"' {print $0}




##############################################################################
##############################################################################
##                                                                          ##
##                          IO REDIRECTION                                  ##
##                                                                          ##
##############################################################################
##############################################################################

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





##############################################################################
##############################################################################
##                                                                          ##
##                          OTHER TOOLS                                     ##
##                                                                          ##
##############################################################################
##############################################################################

# top order by memory consumption on OSx
top -o mem

# to show a keyboard key terminal escape sequence
cat -v

# to invoke a pure zsh
zsh -f


##############################################################################
##############################################################################
##                                                                          ##
##                          INSANE ONE-LINERS                               ##
##                                                                          ##
##############################################################################
##############################################################################

# found on: http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html
tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | sed ${1}q

