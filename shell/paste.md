# Paste tricks

* useful utility for joining lines:

```sh
# ag:
# -G [pattern]: search only file that ends with sh
# -c: do not print line matches, but only filename:count where count is the number of matches
# the cut part only grabbing the counts
# paste is joining lines and substituting delimiter for + sign to pass to bc. 
# bc sums it up
$ mcc λ ag -c -G 'sh$' docker | cut -f2 -d':' | paste -s -d+ | bc
  90
$ mcc λ
```
