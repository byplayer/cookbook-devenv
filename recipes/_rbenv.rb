%w(rbenv::default
   rbenv::ruby_build).each do |recipe|
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
