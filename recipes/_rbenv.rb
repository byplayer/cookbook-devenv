%w(rbenv::default
   rbenv::ruby_build
   rbenv-gemset).each do |recipe|
  include_recipe recipe
end

node['rbenv']['rubies'].each do |ver|
  rbenv_ruby ver
end
