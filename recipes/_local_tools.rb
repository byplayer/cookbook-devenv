# frozen_string_literal: true

git node['local_tools']['install_target'] do
  repository node['local_tools']['repo']
  reference node['local_tools']['ref']
  enable_submodules true
  action :sync
end
