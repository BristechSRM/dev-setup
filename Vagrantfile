# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Possible boxes
  # This is a minimal ubuntu desktop
  config.vm.box = "amplifi/ubuntu-desktop-14.04.minimal"

  # This will run in a host-only network
  config.vm.network "private_network", ip: "192.168.56.101"

  config.vm.provider "virtualbox" do |vb|
  	vb.gui = true
    vb.memory = "3027"
    vb.customize ["modifyvm", :id, "--vram", "50"]
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "hosttoguest"]
  end

  config.vm.synced_folder ".", "/vagrant", disabled:true
  config.vm.synced_folder "..", "/workspace"

  #Configure up with scripts
  config.vm.provision "shell", path: "vagrantScripts/utils.sh"

  config.vm.provision "shell", path: "vagrantScripts/backend-docker.sh"

  config.vm.provision "shell", path: "vagrantScripts/backend-mono.sh"

  config.vm.provision "shell", path: "vagrantScripts/frontend.sh"

  config.vm.provision "shell", inline: "echo Vagrant Provision complete"
end
