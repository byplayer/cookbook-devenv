node.default['conda']['user'] = node['devenv']['user']['name']
node.default['conda']['group'] = node['devenv']['user']['name']

node.default['install']['dir'] = '/opt/anaconda'
node.default['install']['user'] = 'root'

include_recipe 'conda'
