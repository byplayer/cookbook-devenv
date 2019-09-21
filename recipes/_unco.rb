# frozen_string_literal: true

git File.join(Chef::Config['file_cache_path'], 'unco') do
  repository node['unco']['repo']
  reference node['unco']['ref']
  action :sync
end

execute 'install unco' do
  cwd File.join(Chef::Config['file_cache_path'], 'unco')
  command <<-COMMAND
    cmake .
    make preinstall
    cmake -DCMAKE_INSTALL_PREFIX=#{node['unco']['install_target']} -P cmake_install.cmake
    make clean
  COMMAND

  not_if "#{node['unco']['install_target']}/bin/unco --version | grep #{node['unco']['version']}"
end
