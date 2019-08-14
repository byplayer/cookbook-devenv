# frozen_string_literal: true

remote_file "#{Chef::Config['file_cache_path']}/freemind-bin-max-#{node['freemind']['version']}.zip" do
  source "https://jaist.dl.sourceforge.net/project/freemind/freemind/#{node['freemind']['version']}/freemind-bin-max-#{node['freemind']['version']}.zip"
  mode 0o0644
  not_if "#{Chef::Config['file_cache_path']}/freemind-bin-max-#{node['freemind']['version']}.zip"
end

execute "install freemind ver. #{node['freemind']['version']}" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    if [ -s #{node['freemind']['install_target']} ]; then
      rm #{node['freemind']['install_target']}
    fi
    unzip "#{Chef::Config['file_cache_path']}/freemind-bin-max-#{node['freemind']['version']}.zip -d #{node['freemind']['install_target']}-#{node['freemind']['version']}
    ln -s ln -s #{node['freemind']['install_target']}-#{node['freemind']['version']} #{node['freemind']['install_target']}
  COMMAND
  creates "#{node['freemind']['install_target']}-#{node['freemind']['version']}"
  not_if File.exist?("#{node['freemind']['install_target']}-#{node['freemind']['version']}")
end
