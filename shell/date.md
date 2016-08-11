# date tricks

## setting current date

```sh
# print the current date in standard format
$ date
Thu Aug 11 19:02:45 BRT 2016

# copy and paste and change above output to this command
$ date --set 'copy/paste/change/above/format/here'
```

## relative dates 

* Getting relative dates with gnu coreutils date. More info [here](http://www.cyberciti.biz/tips/linux-unix-get-yesterdays-tomorrows-date.html)

```sh
# 1 month ago
$ date "+%Y-%m-%d" --date='1 month ago'

# current date
$ date "+%Y-%m-%d"
```

## convert seconds from epoch to date

* simple:

```sh
$ date --date @120024000 
```

## convert date to seconds from the epoch

* converting a date to seconds from the epoch. more info [here](http://stackoverflow.com/a/12365345/4921402)

```sh
# current date to seconds from the epoch
$ date +%s 

# any date to seconds from the epoch
$ date -d "Oct 21 1973" +%s
```

## timezone manipulations

* Show the local time for 9AM next Friday on the west coast of the US

```sh
$ date --date='TZ="America/Los_Angeles" 09:00 next Fri'
```
