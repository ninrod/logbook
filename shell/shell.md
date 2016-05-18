# Shell tricks

## Links for study

* __[47 Bash pitfalls][1]__

## general tips

### importing shell libraries

* write a `import.sh` like this:

```sh
PROJ_ROOT=$(git rev-parse --show-toplevel)
function proj_shell_boostrap {
  local libfile=${PROJ_ROOT}/path/to/shell-lib/proj-lib.sh
  if [[ -f $libfile ]]; then
    . $libfile
  else
    echo -e "$libfile not found. aborting..."
    exit 1;
  fi
}
proj_shell_boostrap
```

* then import this file with the `.` operator

```sh
. path/to/import.sh
```

### the `--` linux convention

* the `--` is usually a convention for _what follows is not an option, whatever its name_

```sh
# suppose you want to delete a branch called `--track` (but --track is also an option to git).
$ git branch -D -- --track
```

### WTF Unicode? 

```sh
# To check how it's encoded by your console, you can use hexdump.
$ echo -n ☠ | hexdump
$ 0000000 e2 98 a0

$ echo -e "\xE2\x98\xA0"
$ ☠
```

### what shell am I using? 

```sh
$ echo $0
```

## using for and loops

* simple loop to wait 10 secs for something

```sh
$ for i in {1..10}; do
    echo "aguardando conexão db2 por" $i " sec..."
    sleep 1
  done
```

## `sch` | `scp`

* copying a file from local to remote host

```sh
$ scp -r /path/to/local/storage user@remote.host:/path/to/copy
```

* copying a file from remote to local host
```sh
scp -r user@your.server.example.com:/path/to/foo /home/user/Desktop/
```

## curl

* configure `~/.curlrc` proxy

```sh
$ vim ~/.curlrc

# add this
proxy = user:pass@proxy:port
```

* getting a file from a link.

```sh
$ curl -fLo [path/to/file] [link]
```

## chown

* changing all permissions of the files and directories on current path

```sh
$ find . -group 5050 -exec sudo chown vagrant:vagrant {} \;
```


## ip configurations

* setting up interfaces (need for arch-linux vagrant ip to be reachable)

```sh
$ sudo ip link set [eth0] up
```

* show ip address

```sh
$ ip addr show
```

## change standard shell

```sh
sudo sh -c "echo '/bin/zsh' >> /etc/shells"
chsh -s /bin/zsh
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

## echo: appending lines to files

* appending a line to a file using `sudo`

```sh
sudo sh -c "echo '/bin/zsh' >> /etc/shells"
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

* execute a program in background and redirect stdout and stderr to a log file

```sh
$ nohup node server.js > /dev/null 2>&1 &
```

## OTHER utilities

* `top` -> order by memory consumption on OSx: `top -o mem`
* show a keyboard key terminal escape sequence: `cat -v`
* to invoke a pure zsh session without any configuration: `zsh -f`
* show 20 biggest folders from current dir: 

```sh
du -sm * | sort -nr | head -n 20
```


## INSANE ONE-LINERS

* this one was found [here][3].

```sh
tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | sed ${1}q
```
[1]: <http://mywiki.wooledge.org/BashPitfalls>
[2]: <http://stackoverflow.com/questions/637827/redirect-stderr-and-stdout-in-a-bash-script>
[3]: <http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html>
