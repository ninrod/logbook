" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" vertical ruler
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=201

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=black ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=black ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=black ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=black ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
