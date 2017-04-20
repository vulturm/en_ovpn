#!/bin/bash
#
# Provision script for installing openvpn
# Author: Mihai Vultur <mihai.vultur@endava.com>
#

CHEF_VERSION="12.19.36"
PROVISION_DIR=$(pwd)
if [[ -z "$(rpm -qa | grep chef-${CHEF_VERSION})" ]]; then
  curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -v $CHEF_VERSION
fi
if [[ $? -eq 0 ]]; then
  /opt/chef/embedded/bin/ruby /bin/chef-solo --config ${PROVISION_DIR}/solo.rb --json-attributes ${PROVISION_DIR}/custom_attrib.json --log_level info --force-formatter
fi
