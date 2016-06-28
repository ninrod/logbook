# Git Tricks

## general tips

* find the git root:

```sh
$ cd $(git rev-parse --show-toplevel)
```

* find the most recent tag from HEAD

```sh
$ git describe --abbrev=0 --tags
```

## git revision syntax

### Viewing a file as it appears on Remotes, HEAD or INDEX

* showing contents of a file as it appears in `HEAD` | `INDEX`
```sh
# HEAD
$ git show HEAD:path/to/file

# INDEX
$ git show :path/to/file

# REMOTE
$ git show origin/master:path/to/file
```

### referencing a commit relative to a any git reference

* you can reference a commit relative to a branch, HEAD, tag, etc...
* see `$ man git-rev-parse`

```sh
# specifying the leftmost father ancestor of a commit
# these are equivalent: HEAD^ == HEAD^1 == HEAD~ == HEAD~1
$ git show HEAD~

# grandfather ancestor of head, always choosing the left most branch of ancestry
# note that: HEAD^^ == HEAD~~ == HEAD~2
$ git show HEAD~2

# father ancestor of head, choosing the second branch of ancestry, left to right
$ git show HEAD^2

# father ancestor of head, choosing the third branch of ancestry, left to right
$ git show HEAD^3
```

## Merges and Rebases

### Rebase

* `rebase` and `cherry-pick` equivalency (more info [here][5])

```sh
# this snippet
git checkout foo
git checkout -b newbar
git cherry-pick C D E
git checkout bar
git reset --hard newbar
git branch -d newbar

# is functionally equivalent to this snippet
git rebase foo bar
```

### verifying differences between local and upstream

* more info on `$ man gitrevisions` around the line that contains: `:<n>:<path>` 

```sh
# common base:
$ git show :1:package.json

# 'ours'
$ git show :2:package.json

# 'theirs'
$ git show :3:package.json
```

* bonus: resolving conflicts with `--theirs` e `--ours`

```sh
# method 01 'forcing theirs' (or :2: for ours)
git show :3:package.json > package.json
git add package.json

# method 2
$ git checkout --theirs _widget.html.erb
$ git checkout --ours _widget.html.erb
```

### reverting things

* reverting a merge commit
```sh
$ git revert -m 1 <merge_commit_sha>
```

* Reverting last `n` commits: 

```sh
# say you have `A <- B <- C <- D` and want to create a commit that reverts commits B,C,D
$ git reset --hard A

# using a git-reflog reference: @{1} is, in fact, D
$ git reset --soft @{1}

$ git commit
```

* change the pointer `HEAD` is pointing to
```sh
# observe variations: --soft, --mixed e --hard
$ git reset 0d1d7fc32
```

* get your index and work tree into the desired state, without changing HEAD
```sh
$ git checkout 0d1d7fc32 .
```

* aborting a merge/rebase
```sh
# merge
$ git merge --abort

#rebase
$ git rebase --abort

# or yet
$ git reset HEAD --hard
```

## remove, delete files

* remove all `untracked` files

```sh
# verifying what will be removed
$ git clean -f -n

# remove all untracked files and dirs
$ git clean -fd
```

* remove all ignored files from the repo

```sh
$ git ls-files -iX .gitignore| xargs -I{} git rm "{}"
```

* show all untracked and gitignored files in the repo

```sh
$ git ls-files -oiX .gitignore
```

* show all staged (cached, or added to the index) files

```sh
$ git diff --cached --name-only
```

## Branches

### renaming a branch

* If you want to rename a branch while currently at another branch: 

```sh
$ git branch -m <oldname> <newname>
```
* If you want to rename the current branch:

```sh
$ git branch -m <newname>
```
### removing a branch locally and remotelly
* locally: `git branch -D nome/do/branch`
* remotelly: `git push origin --delete nome/do/branch (git 1.7+)`

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

### set up branch tracking
```sh
# or --set-upstream
$ git branch -u origin/master 

# set tracking in a push statement
$ git push -u origin master
```

* showing what branch is tracking what remote: `git branch -vv (doubly verbose)`

```sh
# -vv => doubly verbose
$ git branch -vv 
```

## Git Grep

### searching the history for a pattern

* using xargs

```sh
$ git rev-list --all | xargs -I{} git grep '.bc' {}
4a80d1ed1b9cd13b053498e87017890ad8fd72c5:a.txt:vou buscar pela string abc
$
```

* or, specifying a path

```sh
$ git rev-list --all -- ./.vimrc | xargs -I{} git grep -e 'mapeia' {}
9531cb5c99dfaec66d7275d5994cb29cf53da794:.vimrc:232:" por padrão o exchange.vim mapeia o X no visual mode
744ce3fd47bc1cd69a6c79167ca7956f852de5be:.vimrc:232:" por padrão o exchange.vim mapeia o X no visual mode
fe9958daf4a228b4779689fb9888555684a7ef52:.vimrc:235:" por padrão o exchange.vim mapeia o X no visual mode
$
```

## Git log tricks

### grep trough commit messages

```sh
$ git log --grep=string_in_commit_msg
```

### show only the master branch (only commits made to master)

```sh
# if you are on master
$ git log --first-parent

# if you are not on master
$ git log --first-parent master
```

### show all commits reachable from current heads in your repo

* and without using `--reflog`!

```sh
$ gl $(git show-ref --heads -s | tr '\n' ' ') | head -n 20
```

## git-ls-files

* copying all gitignored and untracked files to another folder mantaining directory structure
```sh
$ git ls-files -oiX .gitignore | xargs -I{} rsync --relative "{}" ../git-ls-files-test-rsync
```

* copying all tracked and gitignored files to another folder mantaining directory structure
```sh
$ git ls-files -iX .gitignore | xargs -I{} rsync --relative "{}" ../git-ls-files-test-rsync
```
## git-ls-tree

* showing tracked files under the current directory

```sh
$ git ls-tree --name-only HEAD .
```

## Creating a remote that lives inside the file system

* Say you have a git repo called `littlegitrepo`. You can create a remote that lives inside the file system with this line: 
* credits go to Michael Schwern's `Git for ages 4 and up`. 

```sh
# here remote will be a true remote
$ git clone --bare littlegitrepo remote

# you can clone from it (local) and do all sorts of stuff
$ git clone remote local
$ git clone remote local2
$ cd local && git status
$ vi a.txt
$ git add a.txt
$ git commit -m 'adding a.txt'
$ git push
$ cd ../local2
$ git fetch
$ git merge
```

## Other useful commands

* tag creation: `git tag -a [tagname] -m 'tag msg'`
* turn off git tracking for a specific file: `git update-index --skip-worktree Gruntfile.js`
* turn on git tracking for a specific file: `git update-index --no-skip-worktree Gruntfile.js`

* create a patch:
  * creating: `git format-patch master --stdout > my_new_patch.diff`
  * applying: `git am < my_new_patch.diff`
  * more info [here](https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/)

* export the working copy: `git archive master | tar -x -C /path`

* git pretty format colors
```sh
git log --pretty=format:"%Credblah%Creset %Cgreenbluh%Creset %C(Yellow)lol%Creset %Cblueduh%Creset %C(magenta)lolmagenta%Creset %C(cyan)sdlkfjsdkfj%Creset %C(white)lollololzors%Creset"
```

* find all commits that changed a file: `git log --follow -p -- filename`

## Bizarre problems

### submodules problems

* updating a repo with submodules

```sh
$ git fetch
$ git rebase
$ git submodule update --init --recursive
```

* cloning and initing submodules

```sh
$ git clone --recursive git://github.com/foo/bar.git
```

* removing a submodule

```sh
$ git rm --cached <submodule name>
$ Delete the now untracked submodule files.
$ Remove directory .git/modules/<submodule name>
$ Delete the relevant lines from the .gitmodules file.
$ Delete the relevant section from .git/config.
$ add o .gitmodules no index
$ git commit
```


### beyond bizarre errors

* fixing the terrible [`zero padded file modes`](http://stackoverflow.com/questions/14700502/how-to-fix-git-zero-padded-file-modes-warning) message:

```sh
mkdir /newrepo
cd /newrepo
git init
cd /oldrepo
git fast-export --all | (cd /newrepo && git fast-import)
git reset HEAD --hard at /newrepo
```

* `bad time zone` fix (basically an export of the local files)

```sh
 git archive master | tar -x -C /somewhere/else
```



## interesting manual entries

* `man gitrevisions(7)`

## Interesting links, tutorials, etc...

* [Learn Git Branching][1]: excelent interactive tutorial (almost a game).
* [Think Like (a) Git][2]: good guide site.
* [Git Magic][3]: excelent html tutorial
* [Reversões de commits][4]: stackoverflow question about how to revert commits.
* [Git For Ages 4 And Up][6]: fantastic fun video introducing git. Highly recommended.

[1]: <http://pcottle.github.io/learnGitBranching/?NODEMO>
[2]: <http://think-like-a-git.net>
[3]: <http://www-cs-students.stanford.edu/~blynn/gitmagic/>
[4]: <http://stackoverflow.com/questions/4114095/revert-git-repo-to-a-previous-commit>
[5]: <http://think-like-a-git.net/sections/rebase-from-the-ground-up/a-helpful-mnemonic-for-git-rebase-arguments.html>
[6]: <https://www.youtube.com/watch?v=1ffBJ4sVUb4>
