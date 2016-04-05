# Docker

## Commands

### clean all containers 

 ```sh
$ docker rm `docker ps -aq`

# or using xargs
$ docker ps -qa | xargs docker rm
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

### run docker inside docker (docker in docker, dind)

* Stolen from https://github.com/jpetazzo/dind
* official images and docs for docker in docker: https://hub.docker.com/_/docker/
* mantainers of official images: https://github.com/docker-library/official-images/blob/master/library/docker
* do not use docker in docker for ci: http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/

* all you have to do is this: 

```sh
$ docker run --privileged -d docker:dind
```

* ... And that's it; you get Docker running in Docker, thanks to the official Docker image, in its "Docker-in-Docker" flavor. You can then connect to this Docker instance by starting another Docker container linking to the first one (which is a pretty amazing thing to do).

* For more details about the docker:dind official image, explanations about how to use it, customize it to use specific storage drivers, and other tidbits of useful knowledge, check its documentation on the Docker Hub: https://hub.docker.com/_/docker/.

## Links

* [cheatsheet](https://github.com/wsargent/docker-cheat-sheet)
* artigos
  * [first steps with docker](http://www.alexecollins.com/first-steps-with-docker/)
  * [tudo o que você precisa saber sobre docker e ninguém nunca te falou](http://developerblog.redhat.com/2014/05/15/practical-introduction-to-docker-containers/)
  * [a docker dev environment in 24 hs](http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-1-of-2/)
  * trabalhando com nginx
    * [exemplo de configuração para trabalhar com html5mode e angularJS](https://gist.github.com/cjus/b46a243ba610661a7efb)
