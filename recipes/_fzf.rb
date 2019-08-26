# frozen_string_literal: true

git File.join(Chef::Config['file_cache_path'], 'fzf') do
  repository node['fzf']['repo']
  reference node['fzf']['ref']
  action :sync
end

directory node['fzf']['install_target'] do
  mode '0755'
  action :create
end

%w[bin shell].each do |dir|
  directory File.join(node['fzf']['install_target'], dir) do
    mode '0755'
    action :create
  end
end

execute 'install fzf' do
  cwd File.join(Chef::Config['file_cache_path'], 'fzf')
  command <<-COMMAND
    export PATH=$PATH:/usr/local/go/bin:$GOBIN

    go build
    cp fzf #{File.join(node['fzf']['install_target'], 'bin')}/
    cp shell/* #{File.join(node['fzf']['install_target'], 'shell')}/
    rsync -avC --delete ./man/ #{File.join(node['fzf']['install_target'], 'man')}/
  COMMAND
end
