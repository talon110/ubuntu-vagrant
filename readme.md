Ubuntu 14.04 VM Readme
=======================

##Purpose
This Vagrant project configures a VM based on Ubuntu 14.04 x64.

Running `vagrant up` in this project will configure a Ubuntu 14.04 x64 virtual machine within VirtualBox.

##Includes
- Apt
- Build-essential
- Vim

##Usage
Before running 'vagrant up', the following steps must be taken:

- Install VirtualBox
- Install Vagrant
- Run `vagrant plugin install vagrant-vbguest` 
- Run `vagrant plugin install vagrant-librarain-chef-nochef`
- Copy desired `id_rsa` and `id_rsa.pub` files to `/config` folder if ssh will be used to connect from the guest virtual machine to another machine 

Notes:

- All Chef cookbooks come from Supermarket