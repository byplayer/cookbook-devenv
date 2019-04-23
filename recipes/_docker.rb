docker_installation_package do
  repo_channel 'nightly'
end

docker_service 'default' do
  action [:create, :start]
end

include_recipe 'docker_compose::installation'
