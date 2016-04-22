define :install_rbenv_gems,
  :user => nil,
  :ruby_ver => nil,
  :gems => [] do
  log("install gems #{params[:ruby_ver]} " +
      "[#{params[:gems].join(',')}]")

  bash "install_rbenv_gems[#{params[:name]}]" do
    user params[:user]
    environment 'HOME' => "/home/#{params[:user]}"
    cwd '/tmp'
    code <<-SH
      cd /tmp
      export RBENV_ROOT=#{node['rbenv']['root_path']}
      export PATH=${RBENV_ROOT}/bin:${PATH}
      eval "$(rbenv init -)"

      tmp_dir=`mktemp -d install_rbenv_gems.XXXXXXXXXX`
      pushd $tmp_dir
      rbenv local #{params[:ruby_ver]}
      gem install --conservative #{params[:gems].join(' ')}
      rbenv rehash

      popd
      rm -r $tmp_dir
    SH
  end
end
