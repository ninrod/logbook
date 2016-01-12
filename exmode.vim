" exec @a macro on visually selected lines
'<,'>norm @a

" exec @a macro on a range defined by marks 'a' and 'b'.
'a,'bnorm @a

" very useful: <c-v> on ex-mode escapes special combos like <C-a>. Here we simulate a 'surround' on every first word of all lines of the file.
%norm cw""P
