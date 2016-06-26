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
