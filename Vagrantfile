# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant'

  KEY_FILE = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip.freeze
  AUTHORIZED_KEYS_PATH = '/home/ubuntu/.ssh/authorized_keys'.freeze
  ADD_KEY = "touch #{AUTHORIZED_KEYS_PATH} && echo #{KEY_FILE} >> #{AUTHORIZED_KEYS_PATH}"

  config.vm.define 'swarm-master' do |d|
    d.vm.box = 'ubuntu/xenial64'
    d.vm.hostname = 'swarm-master'
    d.vm.network 'private_network', ip: '192.168.33.10'
    d.vm.provision 'shell', path: './bootstrap_virtualbox_for_xenial.sh'
    d.vm.provision 'shell', inline: ADD_KEY
    config.vm.provider 'virtualbox' do |vb|
      vb.memory = 1024 + 512
    end
  end

  (1..2).each do |i|
    name = "swarm-node-#{i}"
    config.vm.define "swarm-node-#{i}" do |d|
      d.vm.box = 'ubuntu/xenial64'
      d.vm.hostname = name
      d.vm.network 'private_network', ip: "192.168.33.1#{i}"
      d.vm.provision 'shell', path: './bootstrap_virtualbox_for_xenial.sh'
      d.vm.provision 'shell', inline: ADD_KEY

      config.vm.provider 'virtualbox' do |vb|
        vb.name = "swarm-node-#{i}"
        vb.memory = 512
      end
    end
  end

  config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')
end
