# Vim tricks

## dictionary and spell

### building a dictionary file

* download [pt_BR.zip](http://linorg.usp.br/OpenOffice.org/contrib/dictionaries/pt_BR.zip) file.
* build the spell archive with:

```vim
:mkspell pt pt_BR
```

* set the spell on

```vim
:setlocal spell spelllang=pt
```

* or set it off

## Simulating a __Zoom__

* `:tab split` will open the current buffer in a new tab.
* `:tab help nvim-from-vim` will open the help topic in a new tab.
* `:tabclose` will close the current tab.

## Regex

### visual block regex (with Dr. Chipp's vis plugin)

* substituting `1    2` for `1,2` using `\zs,\ze`

```vim
:'<,'>B s/\v\d\zs\s+\ze\d/,/g
```

* substituting `1    2` for `1,2` using matching groups

```vim
:'<,'>B s/\v(\d)\s+(\d)/\1,\2/g
```

## Performance Profiling

* check vim startup time

```sh
$ vim [file] --startuptime startup.log
$ sort -rk 2 < startup.log | vim -
```

*  link: vimcast about performance [vimcast: Profiling vimscript performance](http://vimcasts.org/episodes/profiling-vimscript-performance/)

* vim help on startup time`h: slow-start` 

## movements

* `n|`: moves to the `n-th` column
* `zt | z<cr>`: Shifts page content so current line sits at the top of the viewport
* `zb | z`: "Shifts page content so current line sits at the bottom of the viewport"
* `zz | z`:  "Shifts page content so current line sits at the middle of the viewport"
* 200zt:  positions line 200 on top of the screen.
* `H`: Moves cursor to the top of the viewport
* `M`: Moves cursor to the middle of the viewport
* `L`: Moves cursor to the bottom of the viewport"
* `gv`: selects again the last visual selection.
* `o` | `v_o`: when a block of text is selected you can use `o` to move to the beggining of the selection. Use it again to go to the end of the selection.
* `g; e g,`:  back and forward na changelist (:changes)
* `<c-i>, <c-o>` -> back and forward na jumplist (:jumps ou :ju)

## folding

* `zi` toggles all folds of the current buffer.
* `zr` decreases the foldlevel by one.
* `zR` decreases the foldlevel to zero -- all folds will be open.
* `zm` increases the foldlevel by one.
* `zM` closes all open folds.
* `[z` move to start of open fold.
* `]z` move to end of open fold.
* `zj` moves the cursor to the next fold.
* `zk` moves the cursor to the previous fold.
* `zO` opens all folds at the cursor.
* `zo` opens a fold at the cursor.
* `zc` closes a fold at the cursor.
* `zd` deletes the fold at the cursor.
* `zE` deletes all folds.
* `zf#j` creates a fold from the cursor down # lines.
* `zf/string` creates a fold from the cursor to string .

## text objects

* `e`: vim-textobj-entire
* `x`: vim-textobj-xmlattr
* `gn`: -> para fazer o match do last pattern.
* `w`: palavra
* `t`: html tag
* `{`, `(`, `[`, `'`: objetos surround do tim pope
    * `ys + obj + surround`: 'you surround'. ex: `ysiw'` coloca asapas em volta de um objeto `iw`.
    * `ds + surround`: apaga o surround
    * `cs + oldsurround + newsurround`: muda o surround

## block mode

* para 'emparelhar' dois blocos de texto
    1. entra no block mode, seleciona as linhas e aperta `$` para ir até o final de todas
    2. insere 2 espaços no começo de cada linha
    3. seleciona a primeira coluna de espaços em block mode
    4. aperta `p` para substituir a primeira coluna de espaços pelo bloco desejado.

## vimdiff

* `:diffput`
* `:diffget`
* `:diffupdate`
* `:diffoff!`
* `:windo` diffthis
* `[c` | `]c` -> movimentação entre diffs.
* para comparar (diffar) dois buffers abertos verticalmente um do lado do outro
    * para começar o diff `:windo diffthis`
    * para terminar: `diffoff!`

## copy/paste

  * `<C-R> + registrador`: paste from register in insert mode. repeatable with `.` operator.
  * `<C-R> + <C-O>`: resultado "mais dinâmico". ver [link](http://vimcasts.org/episodes/pasting-from-insert-mode).

## searching

  * `g*` ou `g#` busca por parte da palavra.

## shell interaction

### suspending vim

* `ctrl + z` -> suspends vim.
* seeing what processes are suspended: `$ jobs`
* unsuspend vim: `$ fg`

### invoke a clean vim (as `zsh -f`)

* `vim -u NONE`

### invoke vim with a specific config

```sh
$ vim -u NONE -N -c ':set runtimepath+=~/.vim/bundle/vim-sneak/' -c ':runtime plugin/sneak.vim'
```

## lists

* command list: `q:`
* search list: `q/`
* change list: `:changes`
* jump list -> `:jumps` ou `:ju`


## ex mode commands

* very useful: `<c-v>` on ex-mode escapes special combos like `<C-a>`, or `<ESC>`. Here we simulate a 'surround' on every first word of all lines of the file: `:%norm cw""P`
* increase next number of all selected lines: `:'<,'>norm ^A`
* decrease next number of all selected lines: `:'<,'>norm ^X`
* exec @a macro on visually selected lines: `:'<,'>norm @a`
* exec @a macro on a range defined by marks 'a' and 'b'.  `:'a,'bnorm @a`
* open quickfix window: `:copen`
* turns buffer into a disposable/scratch buffer: `:set buftype=nofile`
* search with 'very magic' mode on:  `/\v searchstring`
* generate help files from within vim:  `:helpt[ags] ~/.vim/bundle/${plugindir}/doc`
* replace each match of the last pattern with 'bar' within the selected lines in visual mode: `:'<,'>s//bar/g`
* for sorting a range. the 'u' optional parameter will delete duplicate lines: `:'<,'>sort [u]`
* toggle line numbers: `:set nu!`
* toggle relative line numbers: `:set rnu!`
* search/replace com atalho: acha os highlight com '/' e depois soca: `%s//nova/g`
* `:e!`: reverte o buffer para o estado original do arquivo sem sair do vim.

## show the name of the current file

* to show the full qualified path/name of the current file: 

```vim
:echo expand('%:p')

" or
:let @a = expand('%:p')
:put a

" or, more easily, just type `<C-g>`
```

* force the syntax of a buffer `:set syntax=html`
* show/hide relative line numbers `:set rnu`, `:set nornu`
* show/hide line numbers `:set nu`, `:set nonu`

## vimrc hacks

* highlighting trailing whitespace

```vim
highlight ExtraWhitespace ctermbg=218 guibg=218
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
```

* changing diff colors

```vim
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=black ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=black ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=black ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=black ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
```

* draw a vertical ruler

```vim
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=201
```

## plugin tricks

### EasyAlign

* easy align any delimiter
    1. manually select line with `V`
    2. `<CR>` to enter easy align mode
    3. `*` to select all delimiters on the line
    4. `<C-X>` to enter a regular expression
    5. type your delimiter in regex form.
    6. done!

## other tricks

* to force a specific syntax on a file put this on top or bottom

```vim
# -*- mode: markdown -*-
# vi: set ft=markdown :
```
