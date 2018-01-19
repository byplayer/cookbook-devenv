docker_service 'default' do
  action [:create, :start]
end

%w[docker-compose].each do |pkg|
  package pkg do
    action :install
  end
end
