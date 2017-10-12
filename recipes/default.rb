#
# Cookbook Name:: devenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(devenv::_locales
   devenv::_timezone
   devenv::_git
   devenv::_packages
   devenv::_rbenv
   devenv::_devuser
   devenv::_node
   devenv::_docker).each do |recipe|
  include_recipe recipe
end

%w(tmux apt global
   updatedb
   the_silver_searcher apt-repo heroku-toolbelt
   setlayout golang).each do |cookbook|
  include_recipe cookbook
end
