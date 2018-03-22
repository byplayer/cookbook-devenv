template "/etc/nsswitch.conf" do
  source 'etc/nsswitch.conf.erb'
  action :create
end

template "/etc/systemd/resolved.conf" do
  source 'etc/systemd/resolved.conf.erb'
  action :create
end

template "/etc/ntp.conf" do
  source 'etc/ntp.conf.erb'
  action :create
end
