# frozen_string_literal: true

remote_file "#{Chef::Config['file_cache_path']}/emacs-#{node['emacs']['version']}.tar.gz" do
  source    "http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-#{node['emacs']['version']}.tar.gz"
  mode      0o0644
  not_if "test -f #{Chef::Config['file_cache_path']}/emacs-#{node['emacs']['version']}.tar.gz"
end

execute "Extracting and Building emacs #{node['emacs']['version']} from Source" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    if [ -d emacs-#{node['emacs']['version']} ]; then
      rm -f emacs-#{node['emacs']['version']}
    fi

    tar xzf emacs-#{node['emacs']['version']}.tar.gz
    cd emacs-#{node['emacs']['version']}
    ./configure --prefix=#{node['emacs']['prefix']}
    make
    make install
  COMMAND
  creates "#{node['emacs']['prefix']}/bin/emacs"
  not_if "#{node['emacs']['prefix']}/bin/emacs --version | grep #{node['emacs']['version']}"
end
