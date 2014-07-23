# TODO: use locales package
bash 'locale' do
  code <<-EOH
    locale-gen node['devenv']['locale']
    dpkg-reconfigure locales
  EOH
end
