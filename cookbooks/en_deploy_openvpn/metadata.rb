name             "en_deploy_openvpn"
maintainer       "Mihai Vultur"
maintainer_email "xanto@egaming.ro"
license          "Apache 2.0"
description      "Deploy for OpenVPN server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

%w{redhat centos fedora}.each do |os|
  supports os
end

depends 'openvpn', '~> 3.0'
depends 'chef-solo-search'