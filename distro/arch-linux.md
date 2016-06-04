# Arch Linux (running on vagrant) Tricks

## fix network cards

```sh
# find ip address of the vagrant machine
$ ip addr show

# interface will be down. bring it up
$ sudo ip link set [eth0] up
```
