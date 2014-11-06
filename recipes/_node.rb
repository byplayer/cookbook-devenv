%w(libcurl3 curl libssl-dev).each do |pkg|
  package pkg do
    action :install
  end
end

devenv_user_home = "/home/#{node['devenv']['user']['name']}"
git "#{devenv_user_home}/.nvm" do
  repository node['devenv']['nvm']['repos']
  reference node['devenv']['nvm']['ref']
  user node['devenv']['user']['name']
  group node['devenv']['user']['name']
  enable_submodules true
  action :sync
end
