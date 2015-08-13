Readme
----------------------

#Purpose
This vagrant file configures a VM based on Ubuntu x64 which contains the latest
version of the Cloud9 SDK.

#Includes
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

#Usage
Before running 'vagrant up', the following steps must be taken:
- Install VirtualBox
- Install Vagrant
- Run `vagrant plugin install vagrant-vbguest`
- Run `vagrant plugin install vagrant-librarain-chef-nochef`