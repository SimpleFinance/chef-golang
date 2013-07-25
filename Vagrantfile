#!/usr/bin/env ruby

Vagrant.configure('2') do |config|
  config.vm.hostname = 'golang'
  config.vm.box = ENV['VAGRANT_BOX'] || 'opscode_ubuntu-12.04_provisionerless'
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/#{config.vm.box}.box"
  config.omnibus.chef_version = :latest

  config.vm.provision :shell do |shell|
    shell.inline = 'test -f $1 || (sudo apt-get update -y && touch $1)'
    shell.args = '/var/run/apt-get-update'
  end

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      'recipe[golang::default]'
    ]
  end
end

