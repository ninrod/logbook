# Sed tricks

## Simple substitution

* oldfile -> newfile

```sh
$ sed s/day/night/ <oldfile.txt > newfile.txt
```

## finding the top 10 most used zsh commands

```sh
$ sed -r 's/^.{15}//' < ~/.zsh_history | sort | uniq -c | sort -rn | head -n 10
```
## show only the deleted and not staged directories in the current branch/repo.

```sh
# the regex is striping everything from the first '/' to the end of the filename.
$ git ls-files -d | sed 's/\/.*$//g' | sort | uniq
```
