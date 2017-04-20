include_recipe 'chef-solo-search'
include_recipe 'openvpn::server'
node.default['openvpn']['tar_path'] = '/home/centos/keys'
link "#{node['openvpn']['key_dir']}/ca.key" do
  to node['openvpn']['signing_ca_key']
  not_if { ::File.exist? "#{node['openvpn']['key_dir']}/ca.key" }
end
link "#{node['openvpn']['key_dir']}/ca.crt" do
  to node['openvpn']['signing_ca_cert']
  not_if { ::File.exist? "#{node['openvpn']['key_dir']}/ca.crt" }
end
include_recipe 'openvpn::users'
