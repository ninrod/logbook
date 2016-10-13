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

## parameter substitution

* use the parameter substitution form

```shell
fixpath() {
  if [[ "${SHELL_IS_DOCKERIZED}" == "true" ]]; then
    abs_path=$(readlink -f $1)
    fix_path=${abs_path/$HOME/\/home\/vagrant}
    echo $fix_path
  fi
}

path=~/code
abs_path=$(readlink -f $path)
fixed_path=$(fixpath $path)
```
