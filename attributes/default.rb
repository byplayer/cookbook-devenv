default['devenv']['hostname'] = 'dummy.hostname.com'
default['dev_user']['id'] = 'devuser'
default['dev_user']['shell'] = '/usr/bin/zsh'
default['dev_user']['password'] = '$1$SSk7c5ij$JggO4l1XCuWAKFLMveQoK.' # devuser

# tmux
default['tmux']['install_method'] = 'source'
default['tmux']['configure_options'] = %w(--prefix=/opt/tmux)
default['tmux']['version'] = '1.9a'
