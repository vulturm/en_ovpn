#node.default['openvpn'] = {
#	script_security: 2,
#	push_routes: [
#		"push 'route 10.0.2.0 255.255.255.0'"
#	],
#	key: {
#	country: 'RO',
#	province: 'CJ',
#	city: 'Cluj Napoca',
#	org: 'Endava',
#	email: 'xanto@egaming.ro'
#	}
#}

include_recipe 'chef-solo-search'
include_recipe 'openvpn::server'
include_recipe 'openvpn::users'