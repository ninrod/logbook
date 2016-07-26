# Cygwin tricks

## Change home folder after installation

* use the `/etc/nsswitch.conf` file
* more info [here](http://stackoverflow.com/a/1494721/4921402)

```sh
$ vi /etc/nsswitch.conf

# uncomment this line, and configure as follows
db_home: windows
```
