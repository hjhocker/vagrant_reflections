#!/bin/bash

rootz=$(pwd)
rm -rvf /vagrant/vendored_cookbook
mkdir -p /vagrant/vendored_cookbook
cd /vagrant/chef/

for cb in $(ls)
do
  cd $cb
  berks vendor /vagrant/vendored_cookbook
  cd ..
done

cd $rootz
sudo chef-solo -c /vagrant/solo.rb -j /vagrant/attributes.json
