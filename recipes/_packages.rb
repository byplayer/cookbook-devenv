%(zsh).each do |pkg|
  apt_repository pkg do
    action :add
  end
end
