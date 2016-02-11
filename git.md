# Git Tricks

## interesting links

  * [tutorial interativo de git. excelente.](http://pcottle.github.io/learnGitBranching/?NODEMO)

## comandos aprendidos

* criar uma tag: `git tag -a string.da.tag -m 'mensagem da tag'`
* reverter todas as modificações: `git reset HEAD --hard`
* desligar o track de um arquivo: `git update-index --skip-worktree Gruntfile.js`
* ligar de vola o track de um arquivo: `git update-index --no-skip-worktree Gruntfile.js`

* criar um patch:
  * criando: `git format-patch master --stdout > my_new_patch.diff`
  * aplicando: `git am < my_new_patch.diff`
  * mais infos nesse [link](https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/)


* exportar a working copy: `git archive master | tar -x -C /path`

* seeing what changes are comming from upstream (diff): `git diff master..origin/master`

* git pretty format colors
```sh
git log --pretty=format:"%Credblah%Creset %Cgreenbluh%Creset %C(Yellow)lol%Creset %Cblueduh%Creset %C(magenta)lolmagenta%Creset %C(cyan)sdlkfjsdkfj%Creset %C(white)lollololzors%Creset"
```

* find all commits that changed a file: `git log --follow -p -- filename`

## Merges

* para reverter commits locais, veja esse [stackoverflow][1]


## Branches

### Renomeando um branch

* If you want to rename a branch while currently at another branch: 

```sh
$ git branch -m <oldname> <newname>
```
* If you want to rename the current branch:

```sh
$ git branch -m <newname>
```
### deletando um branch localmente e remotamente
* localmente: `git branch -D nome/do/branch`
* remotamente: `git push origin --delete nome/do/branch (git 1.7+)`

### remote branch checkout.

```sh
# here 'remote_branch_name' doesn't exist locally and matches only one name on the remote: 
$ git checkout remote_branch_name

# alternative 
$ git checkout -b localname origin/branchname

# even more verbose alternative
$ git branch --track experimental origin/experimental
$ git checkout experimental
```

### fazer um branch local trackear um branch remoto
```sh
# ou --set-upstream, o -u é de upstream
$ git branch -u origin/master 

# para setar o tracking na oportunidade do primeiro push
$ git push -u origin master
```

* showing what branch is tracking what remote: `git branch -vv (doubly verbose)`

```sh
# -vv => doubly verbose
$ git branch -vv 
```

## solução de problemas bizzaros

### bizarrices de submodulos

* fazendo update de um repo git que tenha submodulos

```sh
$ git fetch
$ git rebase
$ git submodule update --init --recursive
```

* clonando e já inciando os submodules de um git repo que tenha submodulos

```sh
$ git clone --recursive git://github.com/foo/bar.git
```

* para iniciar um submodulo: 

```sh
# em versões abaixo do 1.8.4, = e acima disso não precisa fazer isso a partir da raiz do .git
$ git submodule add http://blah.blu/repo.git
$ git commit.
```

* removendo um submodulo

```sh
$ git rm --cached <submodule name>
$ Delete the now untracked submodule files.
$ Remove directory .git/modules/<submodule name>
$ Delete the relevant lines from the .gitmodules file.
$ Delete the relevant section from .git/config.
$ add o .gitmodules no index
$ git commit
```


### Erros ultra super bizarros

* consertando a terrível mensagem [`zero padded file modes`](http://stackoverflow.com/questions/14700502/how-to-fix-git-zero-padded-file-modes-warning):

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


[1]: <http://stackoverflow.com/questions/4114095/revert-git-repo-to-a-previous-commit>
