# Cut tricks

## using a delimiter and selecting the nth part of a delimited string

* use the -d and -f option. more info [here](http://www.thegeekstuff.com/2013/06/cut-command-examples/?utm_campaign=Feed%3A+TheGeekStuff+(The+Geek+Stuff)&utm_medium=feed&utm_source=feedburner)

```sh
~ ❯ echo "GConf2.x86_64 3.2.6-8.el7 @base" | cut -d'.' -f1
GConf2
~ ❯
```