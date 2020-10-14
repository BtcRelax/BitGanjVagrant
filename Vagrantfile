# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :shell, :run => 'always', :path => "bootstrap.sh", :privileged => true
  config.vm.define "node1" do |node1|
    node1.vm.hostname = "www"
	node1.vm.base_mac  = "080027000001"
	node1.vm.network "public_network",  bridge: "NVIDIA nForce Networking Controller", :mac=> "080027000001", ip: "192.168.2.102", hostname: true
    node1.vm.provision "shell", path: "bootstrap_apache.sh"
		
	node1.vm.provider "virtualbox" do |vb1|
		vb1.name = "www"
		#	vb.memory = "2048"
	end
	
  end

  config.vm.define "node2" do |node2|
    node2.vm.hostname = "db"
    node2.vm.base_mac  = "080027000002"
	node2.vm.network "public_network",  bridge: "NVIDIA nForce Networking Controller", :mac=> "080027000002", ip: "192.168.2.103", hostname: true
	node2.vm.provision "shell", path: "bootstrap_db.sh"
	
	node2.vm.provider "virtualbox" do |vb2|
		vb2.name = "db"
		#	vb.memory = "2048"
	end
  end
  
  config.vm.box_check_update = false

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end