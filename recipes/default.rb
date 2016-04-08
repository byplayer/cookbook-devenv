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
   rbenv::default
   rbenv::ruby_build
   rbenv-gemset
   devenv::_devuser
   devenv::_mongodb
   devenv::_node
   devenv::_p4v
   devenv::_docker).each do |recipe|
  include_recipe recipe
end

%w(tmux apt timezone global ruby_rvm::default
   updatedb
   the_silver_searcher apt-repo mongodb heroku-toolbelt
   setlayout golang).each do |cookbook|
  include_recipe cookbook
end
