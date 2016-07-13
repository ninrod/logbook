# AWK tricks

## in a file, delete a line that contains a pattern

```sh
$ awk '!/pattern/' file > temp && mv temp file
```

## list only the first column of a print

```sh
$ yum list installed | awk '{print $1}'
```
