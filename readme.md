VirtualBox/Ubuntu 14.04/Cloud9 SDK VM Readme
=======================

##Purpose
This vagrant file configures a VM based on Ubuntu 14.04 x64 which contains the latest
version of the Cloud9 SDK.

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

##Usage
Before running 'vagrant up', the following steps must be taken:

- Install VirtualBox
- Install Vagrant
- Run `vagrant plugin install vagrant-vbguest` 
- Run `vagrant plugin install vagrant-librarain-chef-nochef` 

After initial `vagrant up`:

- Test `rails server`
- If the message `rails could not be found` appears, run `rbenv rehash` and try again
- If rails still cannot be found, use `gem install rails` to install rails, or troubleshoot the Vagrantfile/Cheffile

Notes:

- All Chef cookbooks come from Supermarket except for rbenv, which is sourced from <https://github.com/chef-rbenv/chef-rbenv> 