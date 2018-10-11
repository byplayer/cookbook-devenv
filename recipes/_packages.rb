%W[aptitude
   gnome-terminal
   inotify-tools
   lubuntu-desktop zsh autotools-dev automake libtool cmake
   libevent-dev libncurses5-dev zlib1g-dev libbz2-dev libyaml-dev
   libxml2-dev libxslt1-dev libreadline-dev xclip patch
   libx11-dev
   libgmp3-dev
   chromium-browser
   wget ncftp ntp nmap
   ibus-mozc mozc-server mozc-utils-gui
   exuberant-ctags
   emacs emacsen-common rdtool-elisp emacs-goodies-el
   emacs-mozc
   markdown
   xfonts-shinonome python-xlib
   libterm-readkey-perl
   mlocate ssh
   libsqlite3-dev sqlite3
   expect dkms
   libgif-dev
   libmcrypt-dev
   libffi-dev
   libcurl4-gnutls-dev
   libgnutls28-dev
   libgtk-3-dev
   libtiff-dev
   libwebkit2gtk-4.0-dev
   libid3-dev
   eblook lookup-el
   python3-sphinx python3-pip
   python3-sphinxcontrib.plantuml
   postgresql postgresql-client libpq-dev
   manpages-dev
   iftop bmon iptraf nload nethogs speedometer slurm
   iptraf tcptrack vnstat bwm-ng cbm pktstat netdiag
   ifstat nmon saidar
   jq whois
   nginx
   tokyotyrant tokyocabinet-bin libtokyotyrant-dev
   postfix
   cmigemo
   mailutils
   curl unzip libsnappy-dev
   qt4-qmake libqt4-dev xvfb
   rlwrap
   texi2html texinfo
   libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
   qemu-kvm virt-manager libvirt-bin bridge-utils
   libgdbm-dev libgroonga-dev
   llvm clang].each do |pkg|
  package pkg do
    action :install
  end
end
