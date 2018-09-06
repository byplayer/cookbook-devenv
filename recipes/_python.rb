node.default['conda']['user'] = node['devenv']['user']['name']
node.default['conda']['group'] = node['devenv']['user']['name']

include_recipe 'conda'
