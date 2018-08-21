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

if node['devenv']['nvm']['node']
  node['devenv']['nvm']['node'].each do |version, _opt|
    bash 'cleanup .emacs.d elc' do
      cwd devenv_user_home
      user node['devenv']['user']['name']
      environment ({ 'HOME' => devenv_user_home })
      code <<-EOH
        source $HOME/.nvm/nvm.sh

        nvm ls | grep #{version} > /dev/null 2>&1
        if [ $result -eq 0 ]; then
          exit 0
        fi

        nvm install ${version}
      EOH
    end
  end
end
