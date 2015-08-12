# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.memory = 3072
    vb.cpus = 4
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 27017, host: 27117
  config.vm.network :forwarded_port, guest: 8181, host: 8181, auto_correct: true


  config.vm.synced_folder "../sync/www", "/home/vagrant/www", create: true
  config.vm.synced_folder "../sync/projects", "/home/vagrant/project", create: true

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "nodejs"
    chef.add_recipe "nodejs::npm"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "bundler"
    chef.add_recipe "vim"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "postgresql"
    chef.add_recipe "mongodb"
    chef.add_recipe "nginx"

    # Install Ruby 2.2.1 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json = {
      rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: ["2.2.1"],
          global: "2.2.1",
          gems: {
            "2.2.1" => [
              { name: "bundler" }
            ]
          }
        }]
      },
      mysql: {
        server_root_password: ''
      }
    }
  end

  # Update the system; run every time the system is brought up
  config.vm.provision :shell, inline: "apt-get update", run: "always"

  # Remove provision file if VM is reprovisioned
  config.vm.provision :shell, inline: "rm .vagrant_provision.lock"

  # Install Cloud9 IDE
  config.vm.provision :shell, :path => "bootstrap.sh", privileged: false

  # Copy custom config files
  config.vm.provision :shell, :path => "configs.sh", privileged: false, run: "always"

  # Run Cloud9 IDE
  config.vm.provision :shell, inline: "forever start /home/vagrant/cloud9/server.js -w ~/project/",
    run: "always", privileged: false
end
