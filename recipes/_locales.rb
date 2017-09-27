bash 'locale' do
  code <<-EOH
    locale-gen #{node['devenv']['locale']}
    localectl set-locale LANG="#{node['devenv']['locale']}"
    dpkg-reconfigure --frontend=nointeractive locales
  EOH
end
