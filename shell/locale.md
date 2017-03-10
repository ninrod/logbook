# keymaps, layout, locale

## fix cedilha `ç`

* I had to do this on my centos Box:
* [more info here on this cedilha hack fix question](http://unix.stackexchange.com/questions/7493/why-is-the-us-international-keyboard-layout-on-debian-different#comment211671_7687): 

```sh
# some docker container...
-v $(realpath locale-fix/fix-compose-en_US.UTF-8):/usr/share/X11/locale/en_US.UTF-8/Compose \
# blah blah...
```
