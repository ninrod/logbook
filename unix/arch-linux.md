# Arch Linux (running on vagrant) Tricks

## fix network cards

```sh
# find ip address of the vagrant machine
$ ip addr show

# interface will be down. bring it up
$ sudo ip link set [eth0] up
```

## Fix docker daemon configuration

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
