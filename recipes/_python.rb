node['conda']['user'] = node['devenv']['user']['name']
node['conda']['group'] = node['devenv']['user']['name']

include_recipe 'conda'
