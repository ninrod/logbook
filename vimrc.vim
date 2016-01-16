" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" vertical ruler
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=201
