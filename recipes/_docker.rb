docker_installation_package 'default' do
  repo_channel 'nightly'
  package_version nil
end

docker_service 'default' do
  action [:create, :start]
end

include_recipe 'docker_compose::installation'
