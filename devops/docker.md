# Docker

## Arch Linux configuration

* more info on [arch wiki](https://wiki.archlinux.org/index.php/Docker)

```sh
# start docker daemon
$ sudo systemctl enable docker
$ sudo systemctl start docker

# grant group to user
$ gpasswd -a [user, eg. vagrant] docker

# make current session aware of the new group
$ newgrp docker
```

## Commands

### clean all containers 

 ```sh
$ docker ps -qa | xargs -I{} docker rm {}
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

* [cheatsheet](https://github.com/wsargent/docker-cheat-sheet)
* artigos
  * [first steps with docker](http://www.alexecollins.com/first-steps-with-docker/)
  * [tudo o que você precisa saber sobre docker e ninguém nunca te falou](http://developerblog.redhat.com/2014/05/15/practical-introduction-to-docker-containers/)
  * [a docker dev environment in 24 hs](http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-1-of-2/)
  * trabalhando com nginx
    * [exemplo de configuração para trabalhar com html5mode e angularJS](https://gist.github.com/cjus/b46a243ba610661a7efb)
