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

%w(
  .dir_colors .globalrc .ctags .tmux.conf
  .Xresources .gitconfig .xprofile .zshrc
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
%W(
  #{devenv_user_home}/.gconf
  #{devenv_user_home}/.gconf/apps
  #{devenv_user_home}/.gconf/apps/gnome-terminal
  #{devenv_user_home}/.gconf/apps/gnome-terminal/profiles
  #{devenv_user_home}/.gconf/apps/gnome-terminal/profiles/Default
  #{devenv_user_home}/.config
  #{devenv_user_home}/.config/openbox
).each do |dir_name|
  directory dir_name do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode "0700"
    recursive true
    action :create
  end
end

%W(
  #{devenv_user_home}/.gconf/apps
  #{devenv_user_home}/.gconf/apps/gnome-terminal
  #{devenv_user_home}/.gconf/apps/gnome-terminal/profiles
  #{devenv_user_home}/.gconf/apps/gnome-terminal/profiles/Default
).each do |dir|
  file File.join(dir, '%gconf.xml') do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode "0600"
    action :touch
  end
end

template "#{devenv_user_home}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml" do
  source '.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml.erb'
  owner node['devenv']['user']['name']
  group node['devenv']['user']['name']
  mode "0600"
  action :create
end

template "#{devenv_user_home}/.config/openbox/lubuntu-rc.xml" do
  source '.config/openbox/lubuntu-rc.xml.erb'
  owner node['devenv']['user']['name']
  group node['devenv']['user']['name']
  mode "0600"
  action :create
end

if node['devenv']['user']['ssh_key_file']
  directory "#{devenv_user_home}/.ssh" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode "0755"
    action :create
  end

  file "#{devenv_user_home}/.ssh/id_rsa" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode "0600"
    content File.open(node['devenv']['user']['ssh_key_file']) { |f| f.read }
    action :create
  end
end

group 'sudo' do
  members ['vagrant', node['devenv']['user']['name']]
  action [:create, :manage]
end

bash 'copy dic' do
  cwd devenv_user_home

  code <<-EOH
    mkdir -p ./dic
    rsync -av --delete /vagrant/dic ./dic
    chown -R #{node['devenv']['user']['name']}:#{node['devenv']['user']['name']} dic
  EOH
end
