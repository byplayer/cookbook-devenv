define :install_rbenv_gemset,
  :user => nil,
  :ruby_ver => nil,
  :gemset_name => nil,
  :gems => [] do
  log("install gem set #{params[:ruby_ver]} " +
      "#{params[:gemset_name]} [#{params[:gems].join(',')}]")

  bash "install_rbenv_gemset[#{params[:name]}]" do
    user params[:user]
    home "/home/#{params[:user]}"
    cwd '/tmp'
    code <<-SH
      cd /tmp
      export RBENV_HOME=#{node['rbenv']['root_path']}
      export PATH=${RBENV_HOME}/bin:${PATH}
      eval "$(rbenv init -)"

      tmp_dir=`mktemp -d rbenv_gemset_tmp.XXXXXXXXXX`
      pushd $tmp_dir
      rbenv gemset create #{params[:ruby_ver]} #{params[:gemset_name]}
      rbenv local #{params[:ruby_ver]}
      rbenv gemset init #{params[:gemset_name]}
      gem install #{params[:gems].join(' ')}
      rbenv rehash

      popd
      rm -r $tmp_dir
    SH
  end
end

define :install_rbenv_gems,
  :user => nil,
  :ruby_ver => nil,
  :gems => [] do
  log("install gems #{params[:ruby_ver]} " +
      "[#{params[:gems].join(',')}]")

  bash "install_rbenv_gems[#{params[:name]}]" do
    user params[:user]
    home "/home/#{params[:user]}"
    cwd '/tmp'
    code <<-SH
      cd /tmp
      export RBENV_HOME=#{node['rbenv']['root_path']}
      export PATH=${RBENV_HOME}/bin:${PATH}
      eval "$(rbenv init -)"

      tmp_dir=`mktemp -d install_rbenv_gems.XXXXXXXXXX`
      pushd $tmp_dir
      rbenv local #{params[:ruby_ver]}
      gem install #{params[:gems].join(' ')}
      rbenv rehash

      popd
      rm -r $tmp_dir
    SH
  end
end

