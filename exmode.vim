" very useful: <c-v> on ex-mode escapes special combos like <C-a>. 
" Here we simulate a 'surround' on every first word of all lines of the file.
:%norm cw""P

" increase next number of all selected lines
:'<,'>norm ^A

" decrease next number of all selected lines
:'<,'>norm ^X

" exec @a macro on visually selected lines
:'<,'>norm @a

" exec @a macro on a range defined by marks 'a' and 'b'.
:'a,'bnorm @a
