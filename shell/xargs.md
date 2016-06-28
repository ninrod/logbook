# Xargs tricks

## piping a multiline output to single line

* no real standard posix way to do that. use `tr` instead.
* at least that what I understood from [this](http://stackoverflow.com/a/28806991/4921402) so question. 

```sh
$ gl $(git show-ref --heads -s | tr '\n' ' ') | head -n 20
```
