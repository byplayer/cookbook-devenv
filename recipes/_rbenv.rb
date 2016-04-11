%w(rbenv::default
   rbenv::ruby_build
   rbenv-gemset).each do |recipe|
  include_recipe recipe
end

node['rbenv']['rubies'].each do |ver|
  rbenv_ruby ver
end

bash 'rbenv gemsets install' do
  if node['rbenv']['gemsets']
    node['rbenv']['gemsets'].each do |ver, sets|
      sets.each do |gemset_name, gems|
        install_rbenv_gemset do
          user node['rbenv']['user']
          ruby_ver ver
          gemset_name gemset_name
          gems gems
        end
      end
    end
  end
end
