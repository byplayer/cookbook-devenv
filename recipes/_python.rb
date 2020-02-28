# frozen_string_literal: true

pyenv_user_install node['devenv']['user']['name']

pyenv_plugin 'virtualenv' do
  git_url     'https://github.com/pyenv/pyenv-virtualenv.git'
  git_ref     'master'
  user        node['devenv']['user']['name']
end
