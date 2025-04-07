# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_SERVER_URL'] = 'https://vagrant.elab.pro'
Vagrant.configure("2") do |config|
    config.vm.define "belousovPam" do |belousovPam|
        belousovPam.vm.box = "bento/ubuntu-24.04"                      
        belousovPam.vm.host_name = "belousovPam"
        belousovPam.vm.provision "shell", path: "init.sh" 
        belousovPam.vm.network "public_network", bridge: "enp1s0"
        #belousovPam.vm.provision "file", source: "login.sh", destination: "login.sh"
        belousovPam.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
         vb.cpus = "2"
       end 
    end
 end
