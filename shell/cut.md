# Cut tricks

## using a delimiter and selecting the nth part of a delimited string

* use the -d and -f option

```sh
~ ❯ echo "GConf2.x86_64 3.2.6-8.el7 @base" | cut -d'.' -f1
GConf2
~ ❯
```
