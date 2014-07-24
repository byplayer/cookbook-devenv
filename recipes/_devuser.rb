devenv_user_home = "/home/#{node['devenv']['user']['name']}"

user node['devenv']['user']['name'] do
  shell node['devenv']['user']['shell']
  password node['devenv']['user']['password']
  home devenv_user_home
  supports manage_home: true
end

ENV['PATH'] = "/opt/git/bin:#{ENV['PATH']}"

# checkout configuration dirs
%w(.zsh.d .emacs.d).each do |name|
  git "#{devenv_user_home}/#{name}" do
    repository node['devenv'][name]['repo']
    reference node['devenv'][name]['ref']
    user node['devenv']['user']['name']
    group node['devenv']['user']['name']
    checkout_branch node['devenv'][name]['checkout_branch']
    action :sync
  end
end

bash '.zshrc' do
  code <<-EOH
    cp "#{devenv_user_home}/.zsh.d/example.zshrc" "#{devenv_user_home}/.zshrc"
  EOH
end

%w(
  .dir_colors .globalrc .ctags .tmux.conf
  .Xresources .gitconfig .xprofile
).each do |name|
  template "#{devenv_user_home}/#{name}" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    variables git_user_name: node['devenv']['git']['user_name'],
              git_user_email: node['devenv']['git']['user_email']
    action :create
  end
end

# .gconf/apps/gnome-terminal/profiles/Default/%gconf.xml.erb
directory '.gconf/apps/gnome-terminal/profiles/Default' do
  owner node['devenv']['user']['name']
  group node['devenv']['user']['name']
  mode "0700"
  recursive true
  action :create
end

template "#{devenv_user_home}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml" do
  source '.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml.erb'
  owner node['devenv']['user']['name']
  group node['devenv']['user']['name']
  mode "0700"
  action :create
end
