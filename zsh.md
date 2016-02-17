# ZSH tricks

## ZSH Globbing

* more tips can be found [here][1].

```sh
# In zsh, there are |glob qualifiers| and |string modifiers|.

# Here's an example of a |string modifier| 
# string modifiers are always separated by a colon `:`
# `a` = full qualified name
$ print file.txt(:a)

# `A` = like `a`, but resolves symlinks
$ print ~/.vimrc(:A)

# Here's an example of a |glob qualifier| 
# D = include dotfiles 
# / = only directories
print -l ^.git(D/)

# here's an example of a |glob qualifier| and a |string modifier| together. 
# the modifier is always separated by a colon `:`.
$ print ^(.git*)(D.:a)
```

* show all files including 'dot' files that are not named .git:

```sh
# D = include dotfiles;
# . = only files
$ print -l ^.git(D.)
```

* removing all directories except some: `rm -rf ^(vim-colors-solarized|vim-airline)`

* globbing inside a shell function

```sh
fullqualifiedname() {
  print -l ${1:a}
}
```

## zsh erros

* `function definition not found`
```sh
# simply remove all .zcompdump* files from ~
$ rm -f ~/.zcompdump*
```

[1]: <http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell>
