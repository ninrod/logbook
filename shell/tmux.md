# Tmux tricks

## [sunaku's](https://github.com/sunaku) [hack](http://sunaku.github.io/vim-256color-bce.html) for fixing 256-colors colorschemes for vim inside tmux

* this hack solves issues [804](https://github.com/vim/vim/issues/804) of [vim](http://github.com/vim/vim)
* this is fixed in [patch 7.4.1942](https://github.com/vim/vim/commit/d18f672fc9477f3c0cb7cc4ce8d9237ed825c612)

## add direct binds (no-prefix) to tmux.conf

* pane and window management

```txt
bind -n F1 previous-window
bind -n F2 next-window
bind -n F3 select-pane -t :.-
bind -n F9 new-window
bind -n F11 split-window -h
bind -n F12 split-window -v
```

## install tmux with true colors

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

[iTerm nightly]: https://iterm2.com/downloads/nightly/
[homesick]: https://github.com/technicalpickles/homesick
