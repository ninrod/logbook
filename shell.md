# Shell tricks

## curl

* configure `~/.curlrc` proxy

```sh
$ vim ~/.curlrc 

# add this
proxy = user:pass@proxy:port
```

## `find`

### `find` and `git`

* `git` moving all files of a specific type to the current directory:

```sh
for i in $(find . -name '*.md'); do
  git mv $i .
done
```

### copy specific files preserving directory structure

* method 01: using `cpio` utility

```sh
$ find . -iname '*.iml' | cpio -pdm ~/code/testdir
```

* method 02: using `rsync`

```sh
$ find . -iname '*.iml' -exec rsync -R {} ~/code/testdir \;
```

* method 03: using a `for` loop and `cp --parents`

```sh
$ for i in $(find sourcedir -name '*.md'); do
$   cp --parents $i targetdir
$ done
```

* finding all dot files on home directory:

```sh
$ ls -la `find ~ -maxdepth=1 -type l`
```

* show 20 biggest folders from current dir: 

```sh
du -sm * | sort -nr | head -n 20
```

## change standard shell

```sh
sudo echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh
```


## SED MAGIC

* show only the deleted and not staged directories in the current branch/repo.

```sh
# the regex is striping everything from the first '/' to the end of the filename.
$ git ls-files -d | sed 's/\/.*$//g' | sort | uniq
```

## AWK MAGIC

* print lines that match a criteria:

```sh
$ git status --short | awk '$1 == "AA"' {print $0}
```

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

[2]: <http://stackoverflow.com/questions/637827/redirect-stderr-and-stdout-in-a-bash-script>
[3]: <http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html>
