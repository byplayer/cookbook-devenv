default['devenv']['locale'] = 'en_US.UTF-8'
default['devenv']['user']['name'] = 'devuser'
default['devenv']['user']['shell'] = '/usr/bin/zsh'
default['devenv']['user']['password'] = '$1$HhgEQ4ug$CA4/Aqm.LDZuFvtAO4Qu8.' # openssl passwd -1 "devuser"
default['devenv']['user']['ssh_key_file'] = nil
default['devenv']['user']['ssh_authorized_keys'] = nil

default['devenv']['.zsh.d']['repo'] = 'https://github.com/byplayer/dot.zsh.d.git'
default['devenv']['.zsh.d']['ref'] = 'master'
default['devenv']['.zsh.d']['checkout_branch'] = 'local'

default['devenv']['.emacs.d']['repo'] = 'https://github.com/byplayer/dot.emacs.d.git'
default['devenv']['.emacs.d']['ref'] = 'master'
default['devenv']['.emacs.d']['checkout_branch'] = 'local'

default['devenv']['.git-extensions']['repo'] = 'https://github.com/muratayusuke/git-extensions.git'
default['devenv']['.git-extensions']['ref'] = 'master'
default['devenv']['.git-extensions']['checkout_branch'] = 'local'

default['devenv']['.ruby_tool']['repo'] = 'https://github.com/byplayer/ruby_tool.git'
default['devenv']['.ruby_tool']['ref'] = 'master'
default['devenv']['.ruby_tool']['checkout_branch'] = 'local'

default['devenv']['git']['user_name'] = 'devuser'
default['devenv']['git']['user_email'] = 'devuser@hogehoge.hogehoge'

default['devenv']['nvm']['repos'] = 'https://github.com/creationix/nvm.git'
default['devenv']['nvm']['ref'] = 'v0.31.0'

# tmux
default['tmux']['install_method'] = 'source'
default['tmux']['configure_options'] = %w(--prefix=/opt/tmux)
default['tmux']['version'] = '2.2'
default['tmux']['checksum'] = 'bc28541b64f99929fe8e3ae7a02291263f3c97730781201824c0f05d7c8e19e4'

# global
default['global']['version'] = '6.3.3'
default['global']['prefix'] = '/opt/global'

# updatedb
default['updatedb']['locate_pkg'] = 'mlocate'

# go
default['go']['version'] = '1.6'

# rbenv
default['rbenv']['rubies'] = []

