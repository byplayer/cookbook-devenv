# create symlink for php build
link '/usr/include/curl' do
  to '/usr/include/x86_64-linux-gnu/curl'
  only_if 'test -d /usr/include/x86_64-linux-gnu/curl'
end

%w[phpenv::default].each do |recipe|
  include_recipe recipe
end

node['phpenv']['phps'].each_key do |ver|
  phpenv_build ver
end
