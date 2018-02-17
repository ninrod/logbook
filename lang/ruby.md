# ruby tricks

## split a path-like environment variable and delete duplicate paths

```sh
$ ruby -e 'puts %x{echo $LD_LIBRARY_PATH}.split(":").uniq!'
```
