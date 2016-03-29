# Docker

## Comandos úteis que aprendi

* limpar todos os containers:  `docker rm $(docker ps -aq)`
* SSH no container: `docker run -t -i sua_imagem /bin/bash`
* commitar um container como uma imagem: `docker commit <idcontainer> <ninrod/blah>`
* rodar um container com um mount point (no MAC): `docker run -v /Users/bob/myapp/src:/src`
* rodar um springboot java expondo uma porta X considerando um mount point no OSX

```sh
docker run -v /Users/ninrod/code/java/springboot-hello/sbt/build/libs:/home/ninrod/app -d -p 8080:8080 java:8-jre java -jar /home/ninrod/app/ninrod-spring-boot-test-0.1.2.3.jar
```

* rodar um springboot java expondo porta X com o jar já dentro do container (para deployar na cloud)

```sh
docker run -d -p 8080:8080 ninrod/springboot:test java -jar /home/ninrod/delivery/ninrod-spring-boot-test-0.1.2.3.jar
```

* fazer push para o docker hub: `docker push --help`
* logar no ssh considerando um mount point (para copiar coisas para dentro do container)

```sh
docker run -v /Users/ninrod/code/java/springboot-hello/sbt/build/libs:/home/ninrod/app -i -t  java:8-jre /bin/bash
```

* log simples no ssh

```sh
docker exec -it <mycontainer> bash
```

## Links

* [cheatsheet](https://github.com/wsargent/docker-cheat-sheet)
* artigos
  * [first steps with docker](http://www.alexecollins.com/first-steps-with-docker/)
  * [tudo o que você precisa saber sobre docker e ninguém nunca te falou](http://developerblog.redhat.com/2014/05/15/practical-introduction-to-docker-containers/)
  * [a docker dev environment in 24 hs](http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-1-of-2/)
  * trabalhando com nginx
    * [exemplo de configuração para trabalhar com html5mode e angularJS](https://gist.github.com/cjus/b46a243ba610661a7efb)
