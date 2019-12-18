# frozen_string_literal: true

name             'devenv'
maintainer       'byplayer'
maintainer_email 'byplayer100@gmail.com'
license          'All rights reserved'
description      'Installs/Configures devenv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w[tmux apt universal-ctags global
   docker docker_compose
   updatedb
   the_silver_searcher apt-repo heroku-toolbelt
   golang rbenv kubectl
   yarn].each do |cookbook|
  depends cookbook
end
