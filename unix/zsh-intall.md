# Instalação do zsh no OSx

## Se a completion do git estiver cagada.

* tem uma variável do zsh chamada $fpath. Ela contem os diretórios de bootstrap de funções e completions etc...
* print -l $fpath te dará os diretórios.
* em particular, no meu caso tinha dois diretórios:
  * /usr/local/share/zsh/site-functions
  * /usr/local/Cellar/zsh/5.0.8/share/zsh/functions
* no site-functions tinha dois links simbólicos que estavam cagados. tinha um _git symlink e um link para um bash completions. retirei esses links e funcionou lindamente.
* isso porque o _git que interessava mermo era o que estava no Cellar/zsh/5.0.8/share/zsh/functions.
