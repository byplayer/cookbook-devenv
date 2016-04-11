%w(rbenv::default
   rbenv::ruby_build
   rbenv-gemset).each do |recipe|
  include_recipe recipe
end

node['rbenv']['rubies'].each do |ver, gems|
  rbenv_ruby ver
  install_rbenv_gems ver do
    user node['rbenv']['user']
    ruby_ver ver
    gems gems
  end
end

if node['rbenv']['gemsets']
  node['rbenv']['gemsets'].each do |ver, sets|
    sets.each do |gemset_name, gems|
      install_rbenv_gemset "#{ver}@#{gemset_name}" do
        user node['rbenv']['user']
        ruby_ver ver
        gemset_name gemset_name
        gems gems
      end
    end
  end
end
