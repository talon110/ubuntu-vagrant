#! /bin/bash

# Copy config files from Vagrant folder to appropriate paths in the VM
sudo cp /vagrant/config/.gitconfig /home/vagrant/
sudo cp /vagrant/config/.profile /home/vagrant/
sudo cp /vagrant/config/id_rsa* /home/vagrant/.ssh/
