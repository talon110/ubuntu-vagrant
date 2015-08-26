VirtualBox/Ubuntu 14.04/Cloud9 SDK VM Readme
=======================

##Purpose
This Vagrant project configures a VM based on Ubuntu 14.04 x64 which contains the latest version of the Cloud9 SDK.

Running `vagrant up` in this project will configure a Ubuntu 14.04 x64 virtual machine within VirtualBox for serving Cloud9 Stand-alone. It will setup nginx and create a `~/projects` folder in which to work on any projects. This is a perfect project if you want to use the functionality of Cloud9 but can't always be connected to Cloud9's servers.

##Includes
- Apt
- Build-essential
- Mysql 5.5.3
- Postgresql
- Bundler
- Ruby_build
- Nodejs
- Rbenv
- Vim
- Mongodb
- Nginx
- Forever
- Node-gyp
- Cloud9 SDK
- Heroku Toolbelt

##Usage
Before running 'vagrant up', the following steps must be taken:

- Install VirtualBox
- Install Vagrant
- Run `vagrant plugin install vagrant-vbguest` 
- Run `vagrant plugin install vagrant-librarain-chef-nochef`
- Copy desired `id_rsa` and `id_rsa.pub` files to `/config` folder if ssh will be used to connect from the guest virtual machine to another machine 

After initial `vagrant up`:

- Test `rails server`
- If the message `rails could not be found` appears, run `rbenv rehash` and try again
- If rails still cannot be found, use `gem install rails` to install rails, or troubleshoot the Vagrantfile/Cheffile

Notes:

- All Chef cookbooks come from Supermarket except for rbenv, which is sourced from <https://github.com/chef-rbenv/chef-rbenv> 