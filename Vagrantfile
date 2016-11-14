# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# config.ssh.private_key_path = '~/.ssh/id_rsa'
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  #-- don't update guest tools inside the VM
  config.vbguest.auto_update = false

  config.vm.hostname = "openvpn"

  config.vm.box = "centos/7"
#  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.2/vagrant-centos-7.2.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "192.168.200.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  #config.vm.network :forwarded_port, host: 8080, guest: 80
  #config.vm.network :forwarded_port, host: 8000, guest: 8000

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  #config.ssh.max_tries = 40
  #config.ssh.timeout   = 120

  # The path to the Berksfile to use with Vagrant Berkshelf
  #config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
 # config.berkshelf.enabled = true

  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "./cookbooks/openvpn/Berksfile"
  
  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.provision "chef_solo" do |chef|
    chef.channel = "stable"
    chef.version = "12.10.24"
    chef.synced_folder_type = "nfs"
    chef.data_bags_path = "data_bags"
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "chef-solo-search"
    chef.add_recipe "openvpn::server"
    chef.add_recipe "openvpn::users"
    chef.json = {
      "openvpn" => {
        "script_security" => 2,
        "push_routes" => [
			"push 'route 10.0.2.0 255.255.255.0'"
        ],
		"key" => {
		  "country" => "RO",
		  "province" => "CJ",
		  "city" => "Cluj Napoca",
		  "org" => "Endava",
		  "email" => "xanto@egaming.ro"
		}
      }
    }
  end

end
