default['devenv']['locale'] = 'en_US.UTF-8'
default['devenv']['user']['name'] = 'devuser'
default['devenv']['user']['shell'] = '/usr/bin/zsh'
default['devenv']['user']['password'] = '$1$HhgEQ4ug$CA4/Aqm.LDZuFvtAO4Qu8.' # openssl passwd -1 "devuser"

default['devenv']['zshd']['repo'] = 'https://github.com/byplayer/dot.zsh.d.git'
default['devenv']['zshd']['ref'] = 'master'
default['devenv']['zshd']['checkout_branch'] = 'local'

# tmux
default['tmux']['install_method'] = 'source'
default['tmux']['configure_options'] = %w(--prefix=/opt/tmux)
default['tmux']['version'] = '1.9a'
