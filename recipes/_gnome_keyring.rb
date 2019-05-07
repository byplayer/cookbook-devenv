# frozen_string_literal: true

%w[etc/pam.d/login
   etc/pam.d/passwd].each do |path|
  template "/#{path}" do
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
end
