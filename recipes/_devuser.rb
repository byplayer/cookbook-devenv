user node['devenv']['user']['name'] do
  shell node['devenv']['user']['shell']
  password ['devenv']['user']['password']
  home "/home/#{node['devenv']['user']['name']}"
  supports manage_home: true
end