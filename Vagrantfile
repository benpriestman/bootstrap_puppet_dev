# Vagrant file structure inspired by https://github.com/ripienaar/mcollective-vagrant/blob/master/Vagrantfile
 
# apart from the puppet server node, create
# this many client nodes 
INSTANCES=2

# the nodes will be called puppet.example.net
# and node0.example.net, you can change this here
DOMAIN="example.net"

# these nodes do not need a lot of RAM, 384 is
# is enough but you can tweak that here
MEMORY=384

# the instances is a hostonly network, this will
# be the prefix to the subnet they use
SUBNET="192.168.2"

Vagrant.configure("2") do |config|

  config.vm.box = "centos_6_4_x86_64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.vm.provision :puppet, :options => ["--pluginsync", "--modulepath site:modules"] do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "site.pp"
  end

  config.vm.define :puppet do |vmconfig|
    vmconfig.vm.network :private_network, ip: "#{SUBNET}.10"
    vmconfig.vm.hostname = "puppet.#{DOMAIN}"
    vmconfig.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", MEMORY]
    end
  end

  INSTANCES.times do |i|
    config.vm.define "node#{i}".to_sym do |vmconfig|
      vmconfig.vm.network :private_network, ip: "#{SUBNET}.%d" % (10 + i + 1)
      vmconfig.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", MEMORY]
      end
      vmconfig.vm.hostname = "node%d.#{DOMAIN}" % i
    end
  end
end
