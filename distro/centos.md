# Centos tricks

## installing fonts

* just place a font in ~/.fonts
* issue `fc-cache ~/.fonts`
* done.

## yum tricks

* installing X on CentOS: `yum -y groupinstall "X Window System"`
* installing a local package: `sudo yum --nogpgcheck localinstall xclip-0.12-1.el6.rf.x86_64.rpm`
