bash 'install p4v' do
  cwd '/opt'
  creates "/opt/p4v-#{node['p4v']['version']}"
  code <<-EOH
    tar xzf /vagrant/apps/p4v-#{node['p4v']['version']}.tgz
    chown -R root:root p4v-#{node['p4v']['version']}

    if [ -L p4v ];
    then
      rm p4v
    fi

    ln -s p4v-#{node['p4v']['version']} p4v
  EOH
end
