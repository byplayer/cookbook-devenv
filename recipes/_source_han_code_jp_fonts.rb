# frozen_string_literal: true

# https://github.com/adobe-fonts/source-han-code-jp/archive/2.011R.tar.gz
# node['source_han_code_jp_conts']['version']

version = node['source_han_code_jp_conts']['version']
archive_name = "#{version}.tar.gz"
download_path = File.join(Chef::Config['file_cache_path'], archive_name)
install_dir = node['source_han_code_jp_conts']['install_dir']

remote_file download_path do
  source "https://github.com/adobe-fonts/source-han-code-jp/archive/#{version}.tar.gz"
  mode 0o0644
  not_if "test -f #{download_path}"
end

execute 'install source han code jp fonts' do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    tar xzf #{archive_name}
    cp source-han-code-jp-#{version}/OTF/*.otf #{install_dir}/
    fc-cache -fv
  COMMAND

  not_if 'ls #{install_dir} | grep SourceHanCodeJP'
end
