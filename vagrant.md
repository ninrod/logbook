# Vagrant tricks

* vagrant file with `private network` configuration
```ruby
MACHINE_NAME = "arch"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.box = MACHINE_NAME
  config.vm.box_url = MACHINE_NAME + ".box"
  config.vm.hostname = MACHINE_NAME

  config.vm.network "private_network", ip: "192.168.56.2"
  config.vm.provider :virtualbox do |vb, override|
    vb.name = MACHINE_NAME
    vb.customize ["modifyvm", :id, "--memory", "4096"]

    # intel card funciona no CentOS
    vb.customize ["modifyvm", :id, "--nictype2", "82540EM"]
  end

  config.vm.synced_folder "..", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]

  config.vm.network :forwarded_port, guest: 2375, host: 2375
end

# -*- mode: ruby -*-
# vi: set ft=ruby :
```
