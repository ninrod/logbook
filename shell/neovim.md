# Neovim tricks

## building neovim

* first build
```sh
$ brew install ninja
$ git clone https://github.com/neovim/neovim.git
$ cd neovim
$ make
```

* other builds

```sh
$ rm -r build
$ make distclean
$ make clean
$ make CMAKE_BUILD_TYPE=Release
```

* following HEAD builds

```sh
$ make clean
$ make CMAKE_BUILD_TYPE=Release
```
