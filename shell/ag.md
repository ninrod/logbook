# Ag (the silver searcher) Tricks

## build ag

```sh
./build.sh
make install
```

## filename tricks

```sh
# print only the filenames that contain a certain pattern
$ ag -l query

# print files whose filename matches pattern
$ ag -g [pattern]

# restrict search only to files that matches pattern
$ ag -G [pattern] query

# do not print matching lines but filename:count where count is the number of matches 
$ ag -c query
```
