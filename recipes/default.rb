#
# Cookbook Name:: devenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(tmux apt timezone global rvm::user_install).each do |cookbook|
  include_recipe cookbook
end

%w(devenv::_locales
   devenv::_git
   devenv::_packages
   devenv::_devuser).each do |recipe|
  include_recipe recipe
end
