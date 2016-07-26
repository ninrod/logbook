# Bash tricks

## options

* dot not print meta chars, e.g. `ˆC` when <C-c> is pressed to escape a command

```sh
$ stty -echoctl
```

## vi mode

* you can enter vi mode on bash by typing this:

```sh
$ set -o vi
```
## string comparision

* Based on [this](http://stackoverflow.com/a/229606/4921402) answer

```sh
string='My long string';

if [[ $string == *"My long"*  ]]
then
  echo "It's there!";
fi
```

## extended globbing

* inverting glob patterns in bash

```bash
#!/usr/bin/env bash
# turns on bash extended glob
shopt -s extglob

# inverts *.cp glob
for file in dot/*.cp; do
  echo $file
done

# turns off bash extended glob
shopt -u extglob
```
