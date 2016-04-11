%w(rbenv::default
   rbenv::ruby_build
   rbenv-gemset).each do |recipe|
  include_recipe recipe
end

node['rbenv']['rubies'].each do |ver|
  rbenv_ruby ver
end

def install_rbenv_gemset(ruby_ver, gemset_name, gems)
  Chef::Log.info("install gem set #{ruby_ver} #{gemset_name} [#{gems.join(',')}]")
  user node['rbenv']['user']
  cwd '/tmp'
  code <<-SH
    tmp_dir=`mktemp -d rbenv_gemset_tmp.XXXXXXXXXX`
    pushd $tmp_dir
    rbenv gemset create #{ruby_ver} #{gemset_name}
    rbenv local #{ruby_ver}
    rbenv gemset init #{gemset_name}
    gem install #{gems.join(' ')}
    rbenv rehash

    rm -r $tmp_dir
  SH
end

bash 'rbenv gemsets install' do
  if node['rbenv']['gemsets']
    node['rbenv']['gemsets'].each do |ver, sets|
      sets.each do |gemset_name, gems|
        install_rbenv_gemset(ver, gemset_name, gems)
      end
    end
  end
end
