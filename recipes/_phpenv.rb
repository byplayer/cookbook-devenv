%w(phpenv::default).each do |recipe|
  include_recipe recipe
end

node['phpenv']['phps'].each do |ver, _args|
  phpenv_build ver
end
