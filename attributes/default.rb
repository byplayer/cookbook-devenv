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
default['tmux']['version'] = '2.6'
default['tmux']['checksum'] = 'b17cd170a94d7b58c0698752e1f4f263ab6dc47425230df7e53a6435cc7cd7e8'

# global
default['global']['version'] = '6.3.3'
default['global']['prefix'] = '/opt/global'

# updatedb
default['updatedb']['locate_pkg'] = 'mlocate'

# go
default['go']['version'] = '1.10.1'

# rbenv
default['rbenv']['rubies'] = []

# docker-compose
default['docker_compose']['release'] = '1.18.0'

# knife config
default['devenv']['user']['knife_config'] = nil
default['devenv']['user']['knife_key'] = nil

# phpenv
default['phpenv']['git_force_update'] = true
default['phpenv']['php-build']['git_force_update'] = true

default['phpenv']['packages'] = %w(
  re2c
  libsqlite0-dev
  libxml2-dev
  libpcre3-dev
  libbz2-dev
  libcurl4-openssl-dev
  libdb-dev
  libjpeg-dev
  libxpm-dev
  libfreetype6-dev
  libmysqlclient-dev
  postgresql-server-dev-all
  libgmp-dev
  libsasl2-dev
  libmhash-dev
  unixodbc-dev
  freetds-dev
  libpspell-dev
  libsnmp-dev
  libtidy-dev
  libxslt1-dev
  libmcrypt-dev
  libssl-dev
  libreadline-dev
)
