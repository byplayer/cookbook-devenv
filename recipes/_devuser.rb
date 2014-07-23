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

bash 'compile js2-mode' do
  cwd "#{devenv_user_home}/.emacs.d/elisp/js2-mode"
  user node['devenv']['user']['name']
  group node['devenv']['user']['name']
  code <<-EOH
    emacs --batch -f batch-byte-compile js2-mode.el
  EOH
end

%w(
  .dir_colors .globalrc .ctags .tmux.conf
  .Xresources
).each do |name|
  template "#{devenv_user_home}/#{name}" do
  end
end
