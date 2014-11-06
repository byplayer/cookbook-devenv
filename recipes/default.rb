#
# Cookbook Name:: devenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(devenv::_locales
   devenv::_git
   devenv::_packages
   devenv::_devuser
   devenv::_mongodb
   devenv::_node).each do |recipe|
  include_recipe recipe
end

%w(tmux apt timezone global rvm::user docker updatedb
   the_silver_searcher apt-repo mongodb).each do |cookbook|
  include_recipe cookbook
end

%w(devenv::_tmate).each do |recipe|
  include_recipe recipe
end
