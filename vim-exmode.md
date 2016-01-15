## VIM ex command tricks

* very useful: `<c-v>` on ex-mode escapes special combos like `<C-a>`, or `<ESC>`. 
* Here we simulate a 'surround' on every first word of all lines of the file.
```viml
:%norm cw""P
```

* increase next number of all selected lines
```viml
:'<,'>norm ^A
```

* decrease next number of all selected lines
```viml
:'<,'>norm ^X
```

* exec @a macro on visually selected lines
```viml
:'<,'>norm @a
```

* exec @a macro on a range defined by marks 'a' and 'b'.
```viml
:'a,'bnorm @a
```

* open quickfix window: `:copen`

* turns buffer into a disposable/scratch buffer `:set buftype=nofile`
