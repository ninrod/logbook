# Docker

## Assorted Tricks
### clean all containers 

 ```sh
$ docker ps -qa | xargs -I{} docker rm {}
```

### clean all images

```sh
$ docker images | ag '^<none' | awk '{print $3}' | xargs -I{} docker rmi {}
```

### commit a container as an image

```sh
$ docker commit <idcontainer> <ninrod/blah>
```

### open a shell session to a running container

* normal case: 

```sh
docker exec -it <mycontainer> bash
```

* if you want to run tmux inside the container

```sh
# clever hack to overcome docker-exec tty propblem
# see: https://github.com/docker/docker/issues/8755
# in particular, see this comment: https://github.com/docker/docker/issues/8755#issuecomment-83403289
docker exec -it $CONTAINER_NAME script -qc "zsh" /dev/null
```

### copy a file from the container to the host

```sh
$ docker cp <containerId>:/file/path/within/container /host/path/target
```

### discover the ip of the docker host 

* more info [here](https://github.com/docker/docker/issues/23177#issuecomment-228096508)

```sh
$ docker inspect -f '{{.NetworkSettings.Gateway}}' $HOSTNAME
```

### sync timezone with host

* just mount /etc/localtime, e.g:
```sh
docker run \
  -d -t \
  -v /etc/localtime:/etc/localtime:ro \
  yourdocker/image
```

## docker ps

### shrink docker ps horizontal output length

* use the --format option

```sh
alias dp='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'
```

## Links

* [nginx html5mode angularjs sample config](https://gist.github.com/cjus/b46a243ba610661a7efb)
