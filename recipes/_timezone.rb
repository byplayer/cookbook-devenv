if node['platform_version'].to_i >= 16
  bash 'set_timezone' do
    code <<-EOH
      /usr/bin/timedatectl --no-ask-password set-timezone #{node['tz']}
    EOH
  end
else
  bash 'set_timezone' do
    code <<-EOH
      /usr/bin/timedatectl set-timezone #{node['tz']}
    EOH
  end
end
