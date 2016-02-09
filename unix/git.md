# Git

## links
  * [tutorial interativo de git. excelente.](http://pcottle.github.io/learnGitBranching/?NODEMO)
## comandos aprendidos
  * para fazer checkout de um branch remote e já criar um branch local trackeando para esse remoto
    * git checkout nomeDoBranch (onde nomeDoBranch não existe localmente e faz match com um só nome dentre os branches remotos)
  * git tag
    * git tag -a string.da.tag -m 'mensagem da tag'
  * revert do subversion: 
    * git reset HEAD --hard
  * ligar/desligar o foda-se para um arquivo:
    * ligar o foda-se para o track de um arquivo: git update-index --skip-worktree Gruntfile.js
    * desligar o foda-se para o track de um arquivo: git update-index --no-skip-worktree Gruntfile.js
  * criar um patch: 
    * criando: git format-patch master --stdout > my_new_patch.diff
    * aplicando: git am < my_new_patch.diff
    * mais: https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/
  * fazer um branch local trackear um branch remoto
    * git branch -u origin/master (ou --set-upstream, o -u é de upstream)
    * ou git push -u origin master (isso faz um push e fazer o master trackear o origin/master)
  * exportar a working copy
    * git archive master | tar -x -C /path
## solução de problemas bizzaros

### submodulos

* fazendo update de um repo git que tenha submodulos
  * git fetch -> git rebase
  * git submodule update --init --recursive
* clonando e já inciando os submodules de um git repo que tenha submodulos
  * git clone --recursive git://github.com/foo/bar.git
* iniciando um submodulo
  * git clone --recursive git://github.com/foo/bar.git
  * cd bar
  * For already cloned repos, or older Git versions, just use:
  * git clone git://github.com/foo/bar.git
  * cd bar
  * git submodule update --init --recursive
* adicionando um submodulo
  * a partir da raiz do .git, (em versões abaixo do 1.8.4, = e acima disso não precisa) digite:
    * git submodule add http://sbcdf677.bcnet.bcb.gov.br/unix-config/vim-numbertoogle.git .vim/bundle/vim-numbertoogle
    * git commit.
* removendo um submodulo
  * Run git rm --cached <submodule name>
  * Delete the now untracked submodule files.
  * Remove directory .git/modules/<submodule name>
  * Delete the relevant lines from the .gitmodules file.
  * Delete the relevant section from .git/config.
  * adiciona o .gitmodules no index
  * Commit
* atualizando a url de um submodulo
  * http://stackoverflow.com/questions/14404704/how-do-i-replace-a-git-submodule-with-another-repo
* removendo um submodulo de um projeto
  * http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule
* recursively update all submodules
  * git submodule update --init --recursive

### Branches
* renomeando um branch
    * If you want to rename a branch while pointed to any branch, simply do :
    * git branch -m <oldname> <newname>
    * If you want to rename the current branch, you can simply do:
    * git branch -m <newname>
* deletando um branch localmente e remotamente
    * localmente: git branch -D nome/do/branch
    * remotamente: git push origin --delete nome/do/branch (git 1.7+)

### Erros super bizarros
* consertando a terrível mensagem [`zero padded file modes`](http://stackoverflow.com/questions/14700502/how-to-fix-git-zero-padded-file-modes-warning)

```sh
mkdir /newrepo
cd /newrepo
git init
cd /oldrepo
git fast-export --all | (cd /newrepo && git fast-import)
git reset HEAD --hard at /newrepo
```

* se deu erro de 'bad time zone' timezone nos commits anteriores, ou se você quer exportar somente a working copy
```sh
 git archive master | tar -x -C /somewhere/else
```
