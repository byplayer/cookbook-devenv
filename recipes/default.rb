# frozen_string_literal: true

#
# Cookbook Name:: devenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w[
  golang
  golang::packages
  devenv::_freemind
  devenv::_network
  devenv::_locales
  devenv::_timezone
  devenv::_git
  devenv::_gnome_keyring
  devenv::_packages
  devenv::_rbenv
  devenv::_docker
  devenv::_devuser
  devenv::_node
  devenv::_vbox-guest-utils
  devenv::_python
  devenv::_emacs
].each do |recipe|
  include_recipe recipe
end

%w[tmux apt universal-ctags global
   updatedb
   the_silver_searcher apt-repo heroku-toolbelt
   trash-cli kubectl].each do |cookbook|
  include_recipe cookbook
end
