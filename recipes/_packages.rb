%w(aptitude
   gnome-terminal
   lubuntu-desktop zsh autotools-dev automake libtool
   libevent-dev libncurses5-dev zlib1g-dev libbz2-dev libyaml-dev
   libxml2-dev libxslt1-dev libreadline-dev xclip patch
   chromium-browser
   wget ncftp ntp
   ibus-mozc mozc-server mozc-utils-gui
   exuberant-ctags
   emacs24 emacsen-common ibus-el rdtool-elisp emacs-goodies-el
   xfonts-shinonome python-xlib
   libterm-readkey-perl
   mlocate ssh
   libsqlite3-dev sqlite3
   expect dkms
   eblook lookup-el
   libgecode-dev
   python-sphinx python-pip
).each do |pkg|
  package pkg do
    action :install
  end
end
