# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.require_version '>= 1.6.0'

BASE_PATH = '.'
VM_HOME = '/home/vagrant'

VM_DEV_NAME    = 'dev'
VM_DEV_IP      = '172.17.8.100'
VM_DEV_BOX     = 'debian/jessie64'
VM_DEV_BOX_URL = 'https://atlas.hashicorp.com/debian/boxes/jessie64'

API_VERSION = '2'

Vagrant.configure(API_VERSION) do |config|

  # Development machine configuration
  config.vm.define VM_DEV_NAME do |box_config|
    box_config.vm.box = VM_DEV_BOX
    box_config.vm.hostname = VM_DEV_NAME
    box_config.vm.network :private_network, ip: VM_DEV_IP

    # Install custom startup scripts
    box_config.vm.provision :file, source: "#{BASE_PATH}/scripts/apt-install.sh", destination: "#{VM_HOME}/apt-install.sh"
    box_config.vm.provision :shell, inline: "chmod ug+x #{VM_HOME}/apt-install.sh", privileged: true
    box_config.vm.provision :shell, inline: "#{VM_HOME}/apt-install.sh", privileged: true
  end

end
