# frozen_string_literal: true

git File.join(Chef::Config['file_cache_path'], 'emojify') do
  repository node['emojify']['repo']
  reference node['emojify']['ref']
  action :sync
end

directory node['emojify']['install_target'] do
  mode '0755'
  action :create
end

file File.join(node['emojify']['install_target'], 'emojify') do
  content File.read(File.join(Chef::Config['file_cache_path'], 'emojify', 'emojify'))
  mode '0755'
  action :create
end
