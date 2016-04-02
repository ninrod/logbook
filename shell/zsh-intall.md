# Instalação do zsh no OSx

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


## Se a completion do git estiver toda errada, siga esses passos:

* Existe uma variável do zsh chamada `$fpath`.
* Essa variável contem os diretórios de bootstrap de funções e completions etc...
* `print -l $fpath ` te dará os diretórios.
* em particular, no meu caso tinha dois diretórios:

```sh
$ /usr/local/share/zsh/site-functions
$ /usr/local/Cellar/zsh/5.0.8/share/zsh/functions
```

* no site-functions tinha dois links simbólicos que estavam errados. 
* tinha um `_git` symlink e um link para um bash completions. retirei esses links e funcionou perfeitamente.
* isso ocorreu porque o `_git` que correto era o que estava no diretório `Cellar/zsh/5.0.8/share/zsh/functions`.
