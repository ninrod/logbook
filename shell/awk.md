# AWK tricks

## in a file, delete a line that contains a pattern

```sh
$ awk '!/pattern/' file > temp && mv temp file
```

## list only the first column of a print

```sh
$ yum list installed | awk '{print $1}'
```

## example: select 2nd column, skip first line of an output

```
DOCKER_NET_NAME=docker_internal_net
TEMP=$(docker network ls | awk 'NR >= 2 {print $2}' | grep $DOCKER_NET_NAME | wc -l); rc=$?
if [[ "$TEMP" == "1"  ]] && [[ $rc == 0  ]]; then
  echo "$DOCKER_NET_NAME found"
else
  echo "$DOCKER_NET_NAME not found. creating..."
  docker network create $DOCKER_NET_NAME
fi
```
