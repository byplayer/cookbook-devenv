# frozen_string_literal: true

git "#{Chef::Config['file_cache_path']}/emacs" do
  repository node['emacs']['git_repository']
  revision node['emacs']['git_revision']
  action :sync
end

execute "Extracting and Building emacs #{node['emacs']['revision']}(#{node['emacs']['git_revision']}) from Source" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    cd emacs
    ./autogen.sh
    ./configure --prefix=#{node['emacs']['install_dir']} #{node['emacs']['configure_options']}
    make
    rm -rf #{node['emacs']['install_dir']}
    make install
  COMMAND
  not_if "#{node['emacs']['install_dir']}/bin/emacs --version | grep #{node['emacs']['version']}"
end
