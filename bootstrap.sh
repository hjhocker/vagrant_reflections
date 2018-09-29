#!/bin/bash

chef_url="https://packages.chef.io/files/stable/chefdk/3.3.23/ubuntu/18.04/chefdk_3.3.23-1_amd64.deb"
chef_dk="/vagrant/chefdk_ubuntu.deb"

if [[ ! -f $chef_dk ]]
then
  echo "downloading the chef dk from $chef_url"
  curl -X GET $chef_url > $chef_dk
else
  echo "The chef DK already exists"
fi

which chef-client 1> /dev/null 2> /dev/null
if [[ $? -ne 0 ]]
then
  echo "Unpacking the chef dk"
  sudo dpkg -i $chef_dk
fi

sudo /vagrant/provision.sh

exit 0
