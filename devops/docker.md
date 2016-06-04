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

## Links

* [nginx html5mode angularjs sample config](https://gist.github.com/cjus/b46a243ba610661a7efb)
