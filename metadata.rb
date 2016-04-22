name             'devenv'
maintainer       'byplayer'
maintainer_email 'byplayer100@gmail.com'
license          'All rights reserved'
description      'Installs/Configures devenv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(tmux apt timezone global docker updatedb
   the_silver_searcher apt-repo mongodb heroku-toolbelt
   setlayout golang rbenv).each do |cookbook|
  depends cookbook
end
