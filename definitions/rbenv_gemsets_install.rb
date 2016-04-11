
define :install_rbenv_gemset,
  :user => nil,
  :ruby_ver => nil,
  :gemset_name => nil,
  :gems => [] do
  Chef::Log.info("install gem set #{params[:ruby_ver]} " +
                 "#{params[:gemset_name]} [#{params[:gems].join(',')}]")

  bash "install_rbenv_gemset[#{params[:name]}]" do
    user params[:user]
    cwd '/tmp'
    code <<-SH
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

      rm -r $tmp_dir
    SH
  end
end
