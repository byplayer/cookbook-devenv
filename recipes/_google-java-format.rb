# frozen_string_literal: true

directory node['google-java-format']['install_dir'] do |variable|
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

version = node['google-java-format']['version']
jar_url = "https://github.com/google/google-java-format/releases/download/google-java-format-#{version}/google-java-format-#{version}-all-deps.jar"
install_path = File.join(node['google-java-format']['install_dir'], 'google-java-format')

jar_base_name = File.basename(jar_url)
remote_file File.join(Chef::Config['file_cache_path'], jar_base_name) do
  source jar_url
  checksum node['google-java-format']['checksum']
end

bash 'install_google-java-format' do
  user 'root'
  cwd  Chef::Config['file_cache_path']
  code <<-EOH
    cp #{jar_base_name} #{install_path}
    chmod 0755 #{install_path}
  EOH

  not_if File.exist?(install_path) && Digest::SHA256.file(install_path) == node['google-java-format']['checksum']
end
