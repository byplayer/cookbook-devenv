bash 'set_timezone' do
  code <<-EOH
    /usr/bin/timedatectl --no-ask-password set-timezone #{node['tz']}
  EOH
end
