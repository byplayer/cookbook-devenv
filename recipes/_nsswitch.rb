template "/etc/nsswitch.conf" do
  source 'etc/nsswitch.conf.erb'
  action :create
end
