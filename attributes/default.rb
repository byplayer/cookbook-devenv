# frozen_string_literal: true

default['devenv']['locale'] = 'en_US.UTF-8'
default['devenv']['user']['name'] = 'devuser'
default['devenv']['user']['shell'] = '/usr/bin/zsh'
default['devenv']['user']['password'] = '$1$HhgEQ4ug$CA4/Aqm.LDZuFvtAO4Qu8.' # openssl passwd -1 "devuser"
default['devenv']['user']['ssh_key_file'] = nil
default['devenv']['user']['ssh_authorized_keys'] = nil

default['devenv']['.zsh.d']['repo'] = 'https://github.com/byplayer/dot.zsh.d.git'
default['devenv']['.zsh.d']['ref'] = 'main'
default['devenv']['.zsh.d']['checkout_branch'] = nil
default['devenv']['.zsh.d']['enable_checkout'] = false

default['devenv']['.emacs.d']['repo'] = 'https://github.com/byplayer/dot.emacs.d.git'
default['devenv']['.emacs.d']['ref'] = 'main'
default['devenv']['.emacs.d']['checkout_branch'] = nil
default['devenv']['.emacs.d']['enable_checkout'] = false

default['devenv']['.git-extensions']['repo'] = 'https://github.com/muratayusuke/git-extensions.git'
default['devenv']['.git-extensions']['ref'] = 'main'
default['devenv']['.git-extensions']['checkout_branch'] = nil
default['devenv']['.git-extensions']['enable_checkout'] = false

default['devenv']['.ruby_tool']['repo'] = 'https://github.com/byplayer/ruby_tool.git'
default['devenv']['.ruby_tool']['ref'] = 'main'
default['devenv']['.ruby_tool']['checkout_branch'] = nil
default['devenv']['.ruby_tool']['enable_checkout'] = false

default['devenv']['.node_tool']['repo'] = 'https://github.com/byplayer/node_tool.git'
default['devenv']['.node_tool']['ref'] = 'main'
default['devenv']['.node_tool']['checkout_branch'] = nil
default['devenv']['.node_tool']['enable_checkout'] = false

default['devenv']['.highlight']['repo'] = 'https://github.com/byplayer/dot.highlight.git'
default['devenv']['.highlight']['ref'] = 'main'
default['devenv']['.highlight']['checkout_branch'] = nil
default['devenv']['.highlight']['enable_checkout'] = false

default['devenv']['git']['user_name'] = 'devuser'
default['devenv']['git']['user_email'] = 'devuser@hogehoge.hogehoge'

default['devenv']['gpg'] = {}

default['devenv']['nvm']['repos'] = 'https://github.com/creationix/nvm.git'
default['devenv']['nvm']['ref'] = 'v0.33.11'

# tmux
default['tmux']['install_method'] = 'source'
default['tmux']['configure_options'] = %w[--prefix=/opt/tmux]
default['tmux']['version'] = '2.8'
default['tmux']['checksum'] = '7f6bf335634fafecff878d78de389562ea7f73a7367f268b66d37ea13617a2ba'

# global
default['global']['version'] = '6.6.3'
default['global']['prefix'] = '/opt/global'
default['global']['configure_opt'] = '--with-universal-ctags=/opt/universal-ctags/bin/ctags'

# updatedb
default['updatedb']['locate_pkg'] = 'mlocate'
default['updatedb']['prunenames'] = '.git .bzr .hg .svn .cache cache'

# go
default['go']['version'] = '1.12.1'

# rbenv
default['rbenv']['rubies'] = []

# docker-compose
default['docker_compose']['release'] = '1.24.0'

# knife config
default['devenv']['user']['knife_config'] = nil
default['devenv']['user']['knife_key'] = nil

# kubectl
default['kubectl']['version'] = '1.12.3'

# emacs
default['emacs']['version'] = '27.1'
default['emacs']['install_dir'] = '/opt/emacs'

# freemind
default['freemind']['version'] = '1.0.0'
default['freemind']['install_target'] = '/opt/freemind'

# fzf
default['fzf']['repo'] = 'https://github.com/junegunn/fzf.git'
default['fzf']['ref'] = 'master'
default['fzf']['install_target'] = '/opt/fzf'

# source han code jp fonts
default['source_han_code_jp_conts']['version'] = '2.011R'
default['source_han_code_jp_conts']['install_dir'] = '/usr/local/share/fonts'

# unco
default['unco']['repo'] = 'https://github.com/byplayer/unco.git'
default['unco']['ref'] = 'main'
default['unco']['install_target'] = '/opt/unco'
default['unco']['version'] = '0.2.0'

# local_tools
default['local_tools']['repo'] = 'https://github.com/byplayer/local_tools.git'
default['local_tools']['ref'] = 'main'
default['local_tools']['install_target'] = '/opt/local_tools'
