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

# https://bosnadev.com/2015/12/15/allow-remote-connections-postgresql-database-server/
postgresql_access 'local_postgres_superuser' do
  comment 'Local postgres superuser access'
  access_type 'local'
  access_db 'all'
  access_user 'postgres'
  access_addr nil
  access_method 'ident'
end

postgresql_user 'reflections_user' do
  password 'harrison'
  createdb true
end

postgresql_access 'reflections_user' do
  comment 'Foo user access'
  access_type 'host'
  access_db 'all'
  access_user 'reflections_user'
  access_addr '0.0.0.0/0'
  access_method 'md5'
end

template '/etc/postgresql/9.6/main/postgresql.conf' do
  source 'postgresql.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service "postgresql" do
  action :restart
end
