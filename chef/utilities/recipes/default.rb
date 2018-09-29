#
# Cookbook:: utilities
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# execute 'update synaptic' do
#   command 'apt-get update'
# end
#
# ['vim', 'nano', 'wget', 'curl', 'libcurl3', 'nginx', 'zsh', 'htop', 'git', 'jq', 'maven', 'tree', 'gcc', 'rsync', 'unzip', 'build-essential', 'libssl-dev', 'python'].each do |pkg|
#   package pkg do
#     action :install
#   end
# end
#
# include_recipe 'java::default'
# include_recipe 'gradle::default'

postgresql_server_install 'My Postgresql Server install' do
  action :install
end

postgresql_server_install 'Setup my postgresql 9.6 server' do
  version '9.6'
  password 'MyP4ssw0d'
  port 5432
  action :create
end
