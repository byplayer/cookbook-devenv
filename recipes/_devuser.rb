# frozen_string_literal: true

devenv_user_home = "/home/#{node['devenv']['user']['name']}"

user node['devenv']['user']['name'] do
  shell node['devenv']['user']['shell']
  password node['devenv']['user']['password']
  home devenv_user_home
  manage_home true
end

# .gconf/apps/gnome-terminal/profiles/Default/%gconf.xml.erb
%W[
  #{devenv_user_home}/.config
  #{devenv_user_home}/.config/openbox
  #{devenv_user_home}/.config/lxqt
  #{devenv_user_home}/.config/qterminal.org
  #{devenv_user_home}/.config/gtk-3.0
  #{devenv_user_home}/.ctags.d
  #{devenv_user_home}/.gnupg
].each do |dir_name|
  directory dir_name do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode '0700'
    recursive true
    action :create
  end
end

ENV['PATH'] = "/opt/git/bin:#{ENV['PATH']}"

# checkout configuration dirs
%w[.zsh.d
   .emacs.d
   .git-extensions
   .ruby_tool
   .node_tool
   .highlight].each do |name|
  git "#{devenv_user_home}/#{name}" do
    repository node['devenv'][name]['repo']
    reference node['devenv'][name]['ref']
    user node['devenv']['user']['name']
    group node['devenv']['user']['name']
    checkout_branch node['devenv'][name]['checkout_branch']
    enable_checkout node['devenv'][name]['enable_checkout']
    enable_submodules true
    action :sync
  end
end

%w[
  .dir_colors .globalrc .ctags.d/kotlin.ctags .prettierrc
  .tmux.conf
  .Xresources .gitconfig .xprofile .zshrc
  .gitcommit_template.txt
  .xscreensaver .xinputrc .dconf.conf
  .config/openbox/lxqt-rc.xml
  .config/lxqt/panel.conf
  .config/qterminal.org/qterminal.ini
  .config/gtk-3.0/settings.ini
  .xkbmaprc.tpl
  .gnupg/gpg.conf
].each do |name|
  template "#{devenv_user_home}/#{name}" do
    source "#{name}.erb"
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    variables git_user_name: node['devenv']['git']['user_name'],
              git_user_email: node['devenv']['git']['user_email'],
              git_signing_key: node['devenv']['git']['signing_key'],
              gpg_default_key: node['devenv']['gpg']['default_key']
    action :create
  end
end

# it doesn't work
# bash 'load dconfig' do
#   cwd devenv_user_home
#   user node['devenv']['user']['name']
#   environment ({ 'HOME' => devenv_user_home })

#   code <<-EOH
#     DISPLAY=:0 dconf load / < ~/.dconf.conf
#   EOH
# end

%w[
  .xsessionrc
  .private_git_conf.sh
].each do |name|
  template "#{devenv_user_home}/#{name}" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    variables git_user_name: node['devenv']['git']['user_name'],
              git_user_email: node['devenv']['git']['user_email'],
              git_signing_key: node['devenv']['git']['signing_key']
    mode '0755'
    action :create
  end
end

directory "#{devenv_user_home}/.ssh" do
  owner node['devenv']['user']['name']
  group node['devenv']['user']['name']
  mode '0755'
  action :create
end

template "#{devenv_user_home}/.ssh/config" do
  source '.ssh/config.erb'
  owner node['devenv']['user']['name']
  group node['devenv']['user']['name']
  mode '0600'
  action :create
end

if node['devenv']['user']['ssh_key_file']
  file "#{devenv_user_home}/.ssh/id_rsa" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode '0600'
    content File.open(node['devenv']['user']['ssh_key_file'], &:read)
    action :create
  end
end

if node['devenv']['user']['ssh_authorized_keys']
  file "#{devenv_user_home}/.ssh/authorized_keys" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode '0600'
    content File.open(node['devenv']['user']['ssh_authorized_keys'], &:read)
    action :create
  end
end

directory "#{devenv_user_home}/.chef" do
  owner node['devenv']['user']['name']
  group node['devenv']['user']['name']
  mode '0755'
  action :create
end

if node['devenv']['user']['knife_config']
  file "#{devenv_user_home}/.chef/knife.rb" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    content File.open(node['devenv']['user']['knife_config'], &:read)
    action :create
  end
end

if node['devenv']['user']['knife_key']
  file "#{devenv_user_home}/.chef/knife.pem" do
    owner node['devenv']['user']['name']
    group node['devenv']['user']['name']
    mode '0600'
    content File.open(node['devenv']['user']['knife_key'], &:read)
    action :create
  end
end

group 'sudo' do
  members ['vagrant', node['devenv']['user']['name']]
  action %i[create manage]
end

group 'vagrant' do
  members [node['devenv']['user']['name']]
  action %i[create manage]
end

group 'docker' do
  members [node['devenv']['user']['name']]
  action [:create]
end

bash 'copy dic' do
  cwd devenv_user_home

  code <<-EOH
    mkdir -p ./dic
    rsync -av --delete /vagrant/user_data/dic/ ./dic/
    chown -R #{node['devenv']['user']['name']}:#{node['devenv']['user']['name']} dic
  EOH
end

bash 'copy member list' do
  cwd devenv_user_home
  user node['devenv']['user']['name']
  code <<-EOH
    if [ -f /vagrant/user_data/.members ]; then
      cp /vagrant/user_data/.members #{devenv_user_home}/.members
    fi
  EOH
end

# emacs env
bash 'setup emacs hooks' do
  cwd devenv_user_home
  user node['devenv']['user']['name']

  code <<-EOH
    cd .emacs.d
    ./git_hooks/post-merge
  EOH
end

# ruby tool
bash 'ruby tool' do
  cwd devenv_user_home
  user node['devenv']['user']['name']

  code <<-EOH
    cd .ruby_tool
    ./install.sh
  EOH
end

# install node_tool
bash 'install node tool' do
  cwd devenv_user_home
  user node['devenv']['user']['name']
  group node['devenv']['user']['name']
  environment ({ 'HOME' => devenv_user_home })

  code <<-EOH
    cd .node_tool
    ./install.sh
  EOH
end

# sdkman
bash 'install sdkman' do
  cwd devenv_user_home
  user node['devenv']['user']['name']
  environment ({ 'HOME' => devenv_user_home })
  code <<-EOH
    curl -s "https://get.sdkman.io" | bash
  EOH
  not_if "test -f #{devenv_user_home}/.sdkman/bin/sdkman-init.sh"
end
