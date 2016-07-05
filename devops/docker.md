# Docker

## Commands

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

```sh
docker exec -it <mycontainer> bash
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

## Links

* [nginx html5mode angularjs sample config](https://gist.github.com/cjus/b46a243ba610661a7efb)
