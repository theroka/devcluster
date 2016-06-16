# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'fileutils'

Vagrant.require_version ">= 1.6.0"

#BASE_PATH = File.join(File.dirname(__FILE__), "/vm")
BASE_PATH = "."
VM_HOME = "/home/vagrant"

$vm_dev_name    = "dev"
$vm_dev_ip      = "172.17.8.100"
$vm_dev_box     = "debian/jessie64"
$vm_dev_box_url = "https://atlas.hashicorp.com/debian/boxes/jessie64"


Vagrant.configure("2") do |config|

  # Disable guest additions by default for all vagrant vm.
  config.vm.provider :virtualbox do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    v.functional_vboxsf     = false
  end

  # Disable vbguest autoupdate, due to plugin conflict.
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  # Development machine configuration ---------------------------------------------------------
  config.vm.define $vm_dev_name do |config|
    # Custom base image box for vagrant
    config.vm.box = $vm_dev_box
    # config.vm.box_url = $vm_dev_box_url
    config.vm.hostname = $vm_dev_name
    config.vm.network :private_network, ip: $vm_dev_ip
    # Create repo dir and sync with host folder
    config.vm.synced_folder "#{BASE_PATH}/vm", "/home/vagrant", :nfs => true, :mount_options => ['nolock']
    config.vm.synced_folder "#{BASE_PATH}/build", "/home/vagrant/build", :nfs => true, :mount_options => ['nolock']
    # # Install custom startup scripts
    config.vm.provision :file, :source => "#{BASE_PATH}/scripts/apt-install.sh", :destination => "#{VM_HOME}/apt-install.sh"
    config.vm.provision :shell, :inline => "chmod ug+x #{VM_HOME}/apt-install.sh", :privileged => true
    config.vm.provision :shell, :inline => "#{VM_HOME}/apt-install.sh", :privileged => true
  end

end
