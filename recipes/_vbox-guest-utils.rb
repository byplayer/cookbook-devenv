template '/etc/init.d/vbox-guest-utils' do
  source "etc/init.d/vbox-guest-utils.erb"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

service 'vbox-guest-utils' do
  action [ :enable, :start ]
end
