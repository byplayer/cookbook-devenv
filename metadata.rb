name             'devenv'
maintainer       'byplayer'
maintainer_email 'byplayer100@gmail.com'
license          'All rights reserved'
description      'Installs/Configures devenv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# docker docker_compose
%w[tmux apt universal-ctags global
   updatedb
   the_silver_searcher apt-repo heroku-toolbelt
   golang rbenv trash-cli kubectl].each do |cookbook|
  depends cookbook
end
