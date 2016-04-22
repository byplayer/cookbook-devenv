default['devenv']['locale'] = 'en_US.UTF-8'
default['devenv']['user']['name'] = 'devuser'
default['devenv']['user']['shell'] = '/usr/bin/zsh'
default['devenv']['user']['password'] = '$1$HhgEQ4ug$CA4/Aqm.LDZuFvtAO4Qu8.' # openssl passwd -1 "devuser"
default['devenv']['user']['ssh_key_file'] = nil

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
default['tmux']['version'] = '1.9a'
default['tmux']['checksum'] = 'c5e3b22b901cf109b20dab54a4a651f0471abd1f79f6039d79b250d21c2733f5'

# global
default['global']['version'] = '6.3.3'
default['global']['prefix'] = '/opt/global'

# updatedb
default['updatedb']['locate_pkg'] = 'mlocate'

# the_silver_searcher
default['the_silver_searcher']['build_opt'] = '--prefix=/opt/the_silver_searcher'

# p4v
default['p4v']['version'] = '2014.2.951414'

# go
default['go']['version'] = '1.6'

# rbenv
default['rbenv']['rubies'] = []

