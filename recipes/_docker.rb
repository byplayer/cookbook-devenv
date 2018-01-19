docker_service 'default' do
  action [:create, :start]
end

include_recipe 'docker_compose::installation'
