name             'devenv'
maintainer       'byplayer'
maintainer_email 'byplayer100@gmail.com'
license          'All rights reserved'
description      'Installs/Configures devenv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

node['conda']['user'] = node['devenv']['user']['name']
['conda']['group'] = node['devenv']['user']['name']

%w(tmux apt global docker docker_compose docker-machine updatedb
   the_silver_searcher apt-repo heroku-toolbelt
   setlayout golang rbenv trash-cli phpenv conda).each do |cookbook|
  depends cookbook
end
