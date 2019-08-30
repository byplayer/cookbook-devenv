# frozen_string_literal: true

remote_file "#{Chef::Config['file_cache_path']}/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz" do
  source "https://dl.bintray.com/boostorg/release/#{node['boost']['version']}/source/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz"
  mode 0o0644
  not_if "test -f #{Chef::Config['file_cache_path']}/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz"
end

execute "Extracting and Building boost #{node['boost']['version']} from source" do
  cwd node['boost']['install_base']
  command <<-COMMAND
    if [ -L boost ]; then
      rm boost
    fi

    tar xzf #{Chef::Config['file_cache_path']}/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz
    cd boost_#{node['boost']['version']&.tr('.', '_')}
    ./bootstrap.sh --with-toolset=gcc
    ./b2 toolset=gcc -link=static,shared runtime-link=shared threading=multi variant=release --stagedir="stage/gcc"
    ./bootstrap.sh --with-toolset=clang
    ./b2 toolset=clang -link=static,shared runtime-link=shared threading=multi variant=release --stagedir="stage/clang"
    rm -r bin.v2
    cd ../
    ln -s boost_#{node['boost']['version']&.tr('.', '_')} boost
  COMMAND

  not_if "test -d #{File.join(node['boost']['install_base'], 'boost_' + node['boost']['version']&.tr('.', '_'))}"
end
