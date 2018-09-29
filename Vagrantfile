# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<-SCRIPT
  sudo /vagrant/bootstrap.sh
SCRIPT

Vagrant.configure("2") do |config|

  # xenial
  config.vm.box = "ubuntu/bionic64"

  config.vm.network "forwarded_port", guest: 5432, host: 5432

  config.vm.provider "virtualbox" do |v|
    v.name = "reflections"
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.provision "shell", inline: $script

  # config.vm.provision "chef_solo" do |chef|
  #   chef.cookbooks_path = "/vagrant/chef"
  #   chef.add_recipe "utilities"
  #   chef.add_recipe "java"
  # end

end
