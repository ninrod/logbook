# Shell tricks

## ZSH Globbing

* more tips can be found [here][1].
* show all directories including 'dot' directories that are not named `.git`: `print -l ^.git(D/)`
* show all files including 'dot' files that are not named .git: `print -l ^.git(D.)`
* there are _glob qualifiers_ and _string modifiers_. these are different.
    * this is an example of a glob qualifier: `print file.txt(:a)`
    * this is an example of a glob qualifier and a string modifier together. the modifier is separated by a colon `:`.
        * here we print the full qualified name of all files, including dotfiles (not directories) that are not '.git'.
            ```sh
            $ print ^(.git*)(D.:a)
            ```

* removing all directories except some: `rm -rf ^(vim-colors-solarized|vim-airline)`
* git moving all files of a specific type to another directory:

```sh
for i in $(find . -name '*.md'); do
  git mv $i .
done
```

## file manipulation

* copy specific files preserving directory structure
    * method 01: using cpio utility
        ```sh
        $ find . -iname '*.iml' | cpio -pdm ~/code/testdir
        ```
    * method 02: using rsync
        ```sh
        $ find . -iname '*.iml' -exec rsync -R {} ~/code/testdir \;
        ```

* finding all dot files on home directory:
```sh
$ ls -la `find ~ -maxdepth=1 -type l`
```

* show 20 biggest folders from current dir: `du -sm * | sort -nr | head -n 20`


## SED MAGIC

* show only the deleted and not staged directories in the current branch/repo.
    * the regex is striping everything from the first '/' to the end of the filename.
        ```sh
        $ git ls-files -d | sed 's/\/.*$//g' | sort | uniq
        ```

## AWK MAGIC

* print lines that match a criteria: `git status --short | awk '$1 == "AA"' {print $0}`

## IO REDIRECTION

* make a shell script redirect all output to stdout. (see more [here][2])

```sh
# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-
# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>$LOG_FILE
# Redirect STDERR to STDOUT
exec 2>&1
echo "This line will appear in $LOG_FILE, not 'on screen'"
```

## OTHER TOOLS

* `top` -> order by memory consumption on OSx: `top -o mem`
* show a keyboard key terminal escape sequence: `cat -v`
* to invoke a pure zsh session without any configuration: `zsh -f`

## INSANE ONE-LINERS

* this one was found [here][3].

```sh
tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | sed ${1}q
```

[1]: <http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell>
[2]: <http://stackoverflow.com/questions/637827/redirect-stderr-and-stdout-in-a-bash-script>
[3]: <http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html>
