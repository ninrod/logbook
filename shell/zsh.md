# ZSH tricks

## build zsh from source

```sh
$ curl -fLo zsh-5.2.tar.gz http://www.zsh.org/pub/zsh-5.2.tar.gz
$ tar -zxvf zsh-5.2.tar.gz
$ cd zsh-5.2
$ ./configure --with-tcsetpgrp
$ make -j5 
$ make install
```

## ZSH conditional expressions

* `-z`: testing if a shell variable is set

```zsh
# `-z` returns true if string's length is equal to 0.
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi
```

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

* print all files not ending with `.bar`

```sh
$ print -l ^*.bar
```

* print all files not ending with .bar nor .foo

```sh
$ print -l ^(*.bar|*.foo)
```

## zsh errors

* `function definition not found` error
```sh
# simply remove all .zcompdump* files from ~
$ rm -f ~/.zcompdump*
```

[1]: <http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell>


## change the cursor shape in zle-vi-mode in mintty



```sh
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  if [[ -n ${TMUX+x} ]]; then
    if [[ $KEYMAP = vicmd ]]; then
      # the command mode for vi: block shape
      echo -ne "\ePtmux;\e\e[2 q\e\\"
    else
      # the insert mode for vi: line shape
      echo -ne "\ePtmux;\e\e[6 q\e\\"
    fi
  elif [[ $KEYMAP = vicmd ]]; then
    # the command mode for vi: block shape
    echo -ne "\e[2 q"
  else
    # the insert mode for vi: line shape
    echo -ne "\e[6 q"
  fi
  zle reset-prompt
  zle -R
}
```

## TODO: change cursor shape in vi-mode in iTerm2

* more info [here](https://www.iterm2.com/documentation-escape-codes.html)
* escape sequence: `^[]1337;CursorShape=N^G`. N=1, vertical line, N=0, block.

```sh
# place code here
```

# cosmetic tricks

* awesome unicode prompt chars:
  * ›
  * ➤
  * ❯ (from https://raw.githubusercontent.com/sindresorhus/pure/master/readme.md)


# Installing zsh on OSx

## Installing from source

* dependencies

```sh
$ sudo apt-get install -y git-core gcc make autoconf yodl libncursesw5-dev texinfo checkinstall
``` 

* installing

```sh
# Make configure
./Util/preconfig

./configure
make
make check
make install
```


## if git completion is off, follow this steps

* theres a variable called `$fpath`
* this variable contains the path to bootstrap functions, completions, etc...
* `print -l $fpath` will list the directories on $fpath 
* in my case, I had these:

```sh
$ /usr/local/share/zsh/site-functions
$ /usr/local/Cellar/zsh/5.0.8/share/zsh/functions
```

* in the first one, site-functions, I verified that there were 2 wrong symbolic links:
  * tinha um `_git` symlink e um link para um bash completions. retirei esses links e funcionou perfeitamente.
  * a `_git` symlink and a link to a bash completion. I removed these and everything worked like a charm.

## interesting links, tutorials, infos, docs, you name it

[ZSH Gems series #2](http://www.refining-linux.org/archives/37/ZSH-Gem-2-Extended-globbing-and-expansion/#CommentsPane)
[zappter zsh tips](http://zzapper.co.uk/zshtips.html)
