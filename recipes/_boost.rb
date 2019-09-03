# frozen_string_literal: true

remote_file "#{Chef::Config['file_cache_path']}/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz" do
  source "https://dl.bintray.com/boostorg/release/#{node['boost']['version']}/source/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz"
  mode 0o0644
  not_if "test -f #{Chef::Config['file_cache_path']}/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz"
end

install_dir = File.join(node['boost']['install_base'], 'boost_' + node['boost']['version']&.tr('.', '_'))
execute "Extracting and Building boost #{node['boost']['version']} from source" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    if [ -L #{File.join(node['boost']['install_base'], 'boost')} ]; then
      rm #{File.join(node['boost']['install_base'], 'boost')}
    fi

    if [ ! -d boost_#{node['boost']['version']&.tr('.', '_')} ]; then
      tar xzf #{Chef::Config['file_cache_path']}/boost_#{node['boost']['version']&.tr('.', '_')}.tar.gz
    fi

    cd boost_#{node['boost']['version']&.tr('.', '_')}
    ./bootstrap.sh --with-toolset=gcc
    ./b2 toolset=gcc,clang -link=static,shared runtime-link=shared threading=multi variant=release,debug --prefix=#{install_dir} --layout=versioned install

    cp boost.png #{install_dir}/
    cp index.html #{install_dir}/
    cp -r doc #{install_dir}/
    cp -r libs #{install_dir}/
    cd #{node['boost']['install_base']}
    ln -s boost_#{node['boost']['version']&.tr('.', '_')} boost
  COMMAND

  not_if "test -d #{install_dir}"
end

link File.join(install_dir, 'include', 'boost') do
  to File.join(install_dir, 'include',
               "boost-#{node['boost']['version'].split('.').slice(0, 2).join('_')}/boost")
end