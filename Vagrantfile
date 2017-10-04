# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "box-cutter/ubuntu1610"
    config.vm.provision "shell", path: "provision/node.sh", privileged: true

    # Managers
    (1..3).each do |number|
        config.vm.define "m#{number}" do |node|
            node.vm.network "private_network", ip: "192.168.99.20#{number}"
            node.vm.hostname = "m#{number}"
        end  
    end

    # Workers
    (1..4).each do |number|
        config.vm.define "w#{number}" do |node|
            node.vm.network "private_network", ip: "192.168.99.21#{number}"
            node.vm.hostname = "w#{number}"
        end  
    end

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048 
        v.cpus = 1
    end

end
