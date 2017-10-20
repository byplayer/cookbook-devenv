bash 'install_git' do
  cwd '/usr/local/src'
  code <<-EOH
    curl https://raw.github.com/byplayer/docs/master/git/git-install.sh | bash
  EOH
end
