bash 'locale' do
  code <<-EOH
    locale-gen #{node['devenv']['locale']}
    localectl set-locale LANG="#{node['devenv']['locale']}"
    dpkg-reconfigure locales -u LANG="#{node['devenv']['locale']}"
  EOH
end
