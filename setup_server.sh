#!/bin/bash

mkdir -p /software/
cd /software
git clone https://github.com/hjhocker/vagrant_reflections.git
cd /software/vagrant_reflections
chef-solo -c solo.rb -j attributes.json
