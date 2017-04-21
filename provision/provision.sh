#!/bin/bash
#
# Provision script for installing openvpn
# Author: Mihai Vultur <mihai.vultur@endava.com>
#

CHEF_VERSION="12.10.24"
if [[ -z $1 ]]; then
  PROVISION_DIR=$(pwd)
else
  PROVISION_DIR=$1
fi

if [[ ! -f ${PROVISION_DIR}/solo.rb ]]; then
  echo "Missing 'chef-solo' config"
  exit 1
fi

NEEDS_ROOT=""
if [[ "$EUID" -ne 0 ]]; then
  NEEDS_ROOT="sudo "
fi

if [[ -z "$(rpm -qa | grep chef-${CHEF_VERSION})" ]]; then
  curl -L https://omnitruck.chef.io/install.sh | $NEEDS_ROOT bash -s -- -v $CHEF_VERSION
fi
if [[ $? -eq 0 ]]; then
  $NEEDS_ROOT /opt/chef/embedded/bin/ruby /bin/chef-solo --config ${PROVISION_DIR}/solo.rb --json-attributes ${PROVISION_DIR}/custom_attrib.json --log_level info --force-formatter
fi
