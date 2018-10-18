%W[python3-virtualenv].each do |pkg|
  package pkg do
    action :install
  end
end
