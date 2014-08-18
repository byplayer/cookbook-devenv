bash 'install_git' do
  cwd '/usr/local/src'
  code <<-EOH
    if [ -f git-install.sh ] ; then
      rm -f git-install.sh
    fi

    wget https://raw.github.com/byplayer/docs/master/git/git-install.sh
    bash ./git-install.sh
  EOH
end
