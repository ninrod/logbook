# Shell tricks

## Links for study

* __[47 Bash pitfalls][1]__
* __[writing better shell if's](http://mywiki.wooledge.org/BashPitfalls#if_.5Bgrep_foo_myfile.5D)__
* __[what is the difference between single and double square brackets?](http://serverfault.com/a/52050/394694)__
* __[the \[\[ operator](http://mywiki.wooledge.org/BashFAQ/031)__
* `$ man test`

## running commands/scripts in background

```sh
#!/bin/sh
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd -P)"; cd $SCRIPT_PATH
squirrel_log=$SCRIPT_PATH/init.log
echo "initiating. check file $init_log"
nohup $SCRIPT_PATH/awesome-script.sh "$@" > $init_log 2>&1 &
```

## posix tricks

### getting the truepath to a location

* you usually have access to `realpath` or `readlink -f`. If not, try this:

```sh
truepath () {
  echo $(cd $(dirname $1); pwd P)/$(basename $1);
}
```
## General tips

### Setting the time and date

```sh
$ date -s "19 MAY 2016 15:10:00"
```

### Verifying if a command is available 

* use the `posix`: `command`

```sh
if command -v "$COMMAND_NAME" > /dev/null; then
  echo "$COMMAND_NAME is available"
fi
```

### Gettting the full path off a script to itself

```sh
$ SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"
```

### Importing shell libraries

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

### The `--` linux convention

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

$ tricks › echo -n ❯ | hexdump
$ 0000000 9de2 00af
$ 0000003

$ echo ★ | hexdump -C
$ 00000000  e2 98 85 0a                                       |....|
$ 00000004

$ echo -e "\xE2\x98\xA0"
$ ☠
```

### What shell am I using? 

```sh
$ echo $0
```

### Inspecting what return code the last command gave us

```sh
# in zsh
$ print $?

# in bash
$ echo $?
```

### verify if a user has sudo powers

```sh
$ sudo -l -U user_login
```

## ldd: discover on what libraries does an executable depends upon in runtime

* docker example

```sh
~ λ ldd /usr/bin/docker-current
        linux-vdso.so.1 =>  (0x00007fffa61f8000)
        libaudit.so.1 => /lib64/libaudit.so.1 (0x00007f02f5e37000)
        libsystemd.so.0 => /lib64/libsystemd.so.0 (0x00007f02f5e0f000)
        libseccomp.so.2 => /lib64/libseccomp.so.2 (0x00007f02f5be2000)
        libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f02f59c6000)
        libdl.so.2 => /lib64/libdl.so.2 (0x00007f02f57c2000)
        libdevmapper.so.1.02 => /lib64/libdevmapper.so.1.02 (0x00007f02f5567000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f02f51a5000)
        libcap.so.2 => /lib64/libcap.so.2 (0x00007f02f4fa0000)
        libm.so.6 => /lib64/libm.so.6 (0x00007f02f4c9d000)
        librt.so.1 => /lib64/librt.so.1 (0x00007f02f4a95000)
        libselinux.so.1 => /lib64/libselinux.so.1 (0x00007f02f4870000)
        liblzma.so.5 => /lib64/liblzma.so.5 (0x00007f02f464a000)
        libgcrypt.so.11 => /lib64/libgcrypt.so.11 (0x00007f02f43c9000)
        libgpg-error.so.0 => /lib64/libgpg-error.so.0 (0x00007f02f41c4000)
        libresolv.so.2 => /lib64/libresolv.so.2 (0x00007f02f3fa9000)
        libdw.so.1 => /lib64/libdw.so.1 (0x00007f02f3d62000)
        libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f02f3b4c000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f02f6068000)
        libsepol.so.1 => /lib64/libsepol.so.1 (0x00007f02f3906000)
        libudev.so.1 => /lib64/libudev.so.1 (0x00007f02f38f1000)
        libattr.so.1 => /lib64/libattr.so.1 (0x00007f02f36ec000)
        libpcre.so.1 => /lib64/libpcre.so.1 (0x00007f02f348a000)
        libelf.so.1 => /lib64/libelf.so.1 (0x00007f02f3274000)
        libbz2.so.1 => /lib64/libbz2.so.1 (0x00007f02f3064000)
        libz.so.1 => /lib64/libz.so.1 (0x00007f02f2e4d000)
~ λ
```
## Using for and loops

* simple loop to wait 10 secs for something

```sh
$ for i in {1..10}; do
    echo "aguardando conexão db2 por" $i " sec..."
    sleep 1
  done
```

## `scp`: secure copy

* copying a file from local to remote host

```sh
$ scp -r /path/to/local/storage user@remote.host:/path/to/copy
```

* copying a file from remote to local host

```sh
scp -r user@your.server.example.com:/path/to/foo /home/user/Desktop/
```

## Curl

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

## Chown

* changing all permissions of the files and directories on current path

```sh
$ find . -group 5050 -exec sudo chown vagrant:vagrant {} \;
```

## alternative to `realpath`

* use non-POSIX readlink more info [here](http://stackoverflow.com/a/284671/4921402):

```sh
# this is from GNU's readlink implementation
# just man readlink to see the differences
$ readlink -m /path/to/somewhere
$ readlink -f /path/to/somewhere
```

* a semi-POSIX way: (not all unices implemen the pwd `-P` option)

```sh
# usage custom_realpath /path/to/file/or/dir
custom_realpath() {
  echo $(cd $(dirname $1); pwd -P)/$(basename $1);
}
```

## Ip configurations

* setting up interfaces (need for arch-linux vagrant ip to be reachable)

```sh
$ sudo ip link set [eth0] up
```

* show ip address

```sh
$ ip addr show
```

## Change standard shell

```sh
sudo sh -c "echo '/bin/zsh' >> /etc/shells"
chsh -s /bin/zsh
```



## AWK MAGIC

* print lines that match a criteria:

```sh
$ git status --short | awk '$1 == "AA"' {print $0}
```

## Echo: appending lines to files

* appending a line to a file using `sudo`

```sh
sudo sh -c "echo '/bin/zsh' >> /etc/shells"
```

## IO REDIRECTION

### make a shell script redirect all output to stdout. (see more [here][2])

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

### more info about shell redirection

[What are the shell's control and redirection operators?](https://unix.stackexchange.com/q/159513/155613)
[Difference between 2>&1 > output.log and 2>&1 | tee output.log](https://unix.stackexchange.com/a/20472/155613)

## OTHER utilities

* `top` -> order by memory consumption on OSx: `top -o mem`
* show a keyboard key terminal escape sequence: `cat -v`
* to invoke a pure zsh session without any configuration: `zsh -f`
* show 20 biggest folders from current dir:

```sh
du -sm * | sort -nr | head -n 20
```

* show the contents of a jar file

```sh
$ unzip -v jarfile.jar
```


## INSANE ONE-LINERS

* this one was found [here][3].

```sh
tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | sed ${1}q
```

[1]: <http://mywiki.wooledge.org/BashPitfalls>
[2]: <http://stackoverflow.com/questions/637827/redirect-stderr-and-stdout-in-a-bash-script>
[3]: <http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html>
