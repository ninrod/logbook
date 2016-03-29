# Docker

## Commands

### clean all containers 

 ```sh
$ docker rm $(docker ps -aq)
```

### commit a container as an image

```sh
$ docker commit <idcontainer> <ninrod/blah>
```

### open a shell session to the container

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
