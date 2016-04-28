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
