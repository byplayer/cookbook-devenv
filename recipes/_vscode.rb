apt_repository 'vscode' do
  uri          'https://packages.microsoft.com/repos/vscode'
  arch         'amd64'
  distribution 'stable'
  components   ['main']
  key          'https://packages.microsoft.com/keys/microsoft.asc'
end

package 'code'  do
  action :install
end