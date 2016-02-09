# to force a specifix syntax, e.g. ruby, put the snippet bellow to the file

# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "centos-7.2"
  config.vm.box_url = "centos-7.2.box"
  config.vm.hostname = "centos-7.2"

  config.vm.network "private_network", ip: "192.168.56.2"
  config.vm.provider :virtualbox do |vb, override|
    vb.name = "centos-7.2"
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    # intel card funciona no CentOS
    vb.customize ["modifyvm", :id, "--nictype2", "82540EM"]
  end

  config.vm.synced_folder "../../.", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]

  config.vm.network :forwarded_port, guest: 2375, host: 2375

end

