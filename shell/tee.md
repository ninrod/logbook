# tee

## pipe stream to standard ouput AND to a file

* use tee to see command output AND to log to a file: more info [here](http://unix.stackexchange.com/a/20472/155613).

```sh
$ ./script.sh 2>&1 | tee output.log
```
