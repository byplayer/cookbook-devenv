devenv_user_home = "/home/#{node['devenv']['user']['name']}"

user node['devenv']['user']['name'] do
  shell node['devenv']['user']['shell']
  password node['devenv']['user']['password']
  home devenv_user_home
  supports manage_home: true
end

ENV['PATH'] = "/opt/git/bin:#{ENV['PATH']}"

# .zsh.d
git "#{devenv_user_home}/.zsh.d" do
  repository node['devenv']['zshd']['repo']
  reference node['devenv']['zshd']['ref']
  user node['devenv']['user']['name']
  checkout_branch node['devenv']['zshd']['checkout_branch']
  action :sync
end
