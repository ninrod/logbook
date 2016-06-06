# AWK tricks

## in a file, delete a line that contains a pattern

```sh
$ awk '!/pattern/' file > temp && mv temp file
```
