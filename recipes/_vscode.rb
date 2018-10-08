apt_repository 'vscode' do
  uri          'https://packages.microsoft.com/repos/vscode'
  arch         'amd64'
  distribution 'stable precise-cdh4'
  components   ['main']
  key          'https://packages.microsoft.com/keys/microsoft.asc'
end

package 'code'  do
  action :install
end
