# Tmux tricks

## build tmux

* obs: make sure `libevent-devel` is available

```sh
$ curl -fLo tmux-2.2.tar.gz https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
$ tar -zxvf
$ cd tmux-2.2
$ yum install livevent-devel
$ ./configure
$ make
$ make install
```

## [sunaku's](https://github.com/sunaku) [hack](http://sunaku.github.io/vim-256color-bce.html) for fixing 256-colors colorschemes for vim inside tmux

* this hack solves issues [804](https://github.com/vim/vim/issues/804) of [vim](http://github.com/vim/vim)
* this is fixed in [patch 7.4.1942](https://github.com/vim/vim/commit/d18f672fc9477f3c0cb7cc4ce8d9237ed825c612)

## add direct binds (no-prefix) to tmux.conf

* pane and window management

```shell
bind -n F1 previous-window
bind -n F2 next-window
bind -n F3 select-pane -t :.-
bind -n F9 new-window
bind -n F11 split-window -h
bind -n F12 split-window -v
```

* direct assign F1,F2,F3,etc... to window 1,2,3

```shell
bind -n F1 select-window -t 1
bind -n F2 select-window -t 2
bind -n F3 select-window -t 3
bind -n F4 select-window -t 4
bind -n F5 select-window -t 5
bind -n F6 new-window
bind -n F7 command-prompt "rename-window '%%'"
```

* navigate panes with alt+arrow without prefix

```shell
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```

* create panes with C-arrow without prefix

```shell
bind -n C-Left split-window -h
bind -n C-Right split-window -h
bind -n C-Up split-window -v
bind -n C-Down split-window -v
```

## toggle tmux bar on/off

* this toggles tmux bar on/off

```sh
bind-key -n F12 set status
```

## directly rename tmux window

* more info [here](http://unix.stackexchange.com/a/269542/155613)

```sh
bind -n F7 command-prompt "rename-window '%%'"
```


## install tmux with true colors 

### the standard way since tmux 2.2

* install tmux 2.2 or compile from source

* write this in your terminal

```sh
# from outside tmux
$ echo $TERM
xterm-256color

$ tmux attach
$ tmux set-option -ga terminal-overrides ",st-256color:Tc"
$ tmux detach
$ tmux attach
$ tmux info | grep Tc
```

### the hacky patch way with brew in OSx

* Install tmux with truecolor patch

```bash
brew edit tmux
```

* before `def install`, add this.

```ruby
option "with-truecolor", "Build with truecolor patch enabled"
patch do
url "https://gist.githubusercontent.com/zchee/9f6f2ca17acf49e04088/raw/0c9bf0d84e69cb49b5e59950dd6dde6ca265f9a1/tmux-truecolor.diff"
sha1 "8e91ab1c076899feba1340854e96594aafee55de"
end if build.with? "truecolor"
```

Now you can run `brew install tmux --with-truecolor` and get all the colors for iterm nightly.

## list all tmux binds

just press `<prefix> + ?`
more info [here](http://unix.stackexchange.com/a/269542/155613)

## Session Management

to rename the current session: `<prefix> + $`

