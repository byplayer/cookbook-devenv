default['devenv']['locale'] = 'en_US.UTF-8'
default['devenv']['user']['name'] = 'devuser'
default['devenv']['user']['shell'] = '/usr/bin/zsh'
default['devenv']['user']['password'] = '$1$HhgEQ4ug$CA4/Aqm.LDZuFvtAO4Qu8.' # openssl passwd -1 "devuser"
default['devenv']['user']['ssh_key_file'] = nil
default['devenv']['user']['ssh_authorized_keys'] = nil

default['devenv']['.zsh.d']['repo'] = 'https://github.com/byplayer/dot.zsh.d.git'
default['devenv']['.zsh.d']['ref'] = 'master'
default['devenv']['.zsh.d']['checkout_branch'] = nil
default['devenv']['.zsh.d']['enable_checkout'] = false

default['devenv']['.emacs.d']['repo'] = 'https://github.com/byplayer/dot.emacs.d.git'
default['devenv']['.emacs.d']['ref'] = 'master'
default['devenv']['.emacs.d']['checkout_branch'] = nil
default['devenv']['.emacs.d']['enable_checkout'] = false

default['devenv']['.git-extensions']['repo'] = 'https://github.com/muratayusuke/git-extensions.git'
default['devenv']['.git-extensions']['ref'] = 'master'
default['devenv']['.git-extensions']['checkout_branch'] = nil
default['devenv']['.git-extensions']['enable_checkout'] = false

default['devenv']['.ruby_tool']['repo'] = 'https://github.com/byplayer/ruby_tool.git'
default['devenv']['.ruby_tool']['ref'] = 'master'
default['devenv']['.ruby_tool']['checkout_branch'] = nil
default['devenv']['.ruby_tool']['enable_checkout'] = false

default['devenv']['.config/Code/Dictionaries']['repo'] = 'https://github.com/byplayer/Dictionaries.git'
default['devenv']['.config/Code/Dictionaries']['ref'] = 'master'
default['devenv']['.config/Code/Dictionaries']['checkout_branch'] = nil
default['devenv']['.config/Code/Dictionaries']['enable_checkout'] = false

default['devenv']['git']['user_name'] = 'devuser'
default['devenv']['git']['user_email'] = 'devuser@hogehoge.hogehoge'

default['devenv']['nvm']['repos'] = 'https://github.com/creationix/nvm.git'
default['devenv']['nvm']['ref'] = 'v0.33.11'

# tmux
default['tmux']['install_method'] = 'source'
default['tmux']['configure_options'] = %w(--prefix=/opt/tmux)
default['tmux']['version'] = '2.8'
default['tmux']['checksum'] = '7f6bf335634fafecff878d78de389562ea7f73a7367f268b66d37ea13617a2ba'

# global
default['global']['version'] = '6.6.3'
default['global']['prefix'] = '/opt/global'
default['global']['configure_opt'] = '--with-universal-ctags=/opt/universal-ctags/bin/ctags'

# updatedb
default['updatedb']['locate_pkg'] = 'mlocate'

# go
default['go']['version'] = '1.10.3'

# rbenv
default['rbenv']['rubies'] = []

# docker-compose
default['docker_compose']['release'] = '1.18.0'

# knife config
default['devenv']['user']['knife_config'] = nil
default['devenv']['user']['knife_key'] = nil

# kubectl
default['kubectl']['version'] = '1.12.3'
