%w(aptitude
   gnome-terminal
   lubuntu-desktop zsh autotools-dev automake libtool
   libevent-dev libncurses5-dev zlib1g-dev libbz2-dev libyaml-dev
   libxml2-dev libxslt1-dev libreadline-dev xclip patch
   libx11-dev
   libgmp3-dev
   chromium-browser
   wget ncftp ntp
   ibus-mozc mozc-server mozc-utils-gui
   exuberant-ctags
   emacs24 emacsen-common rdtool-elisp emacs-goodies-el
   emacs-mozc
   markdown
   xfonts-shinonome python-xlib
   libterm-readkey-perl
   mlocate ssh
   libsqlite3-dev sqlite3
   expect dkms
   libmcrypt-dev
   libffi-dev
   eblook lookup-el
   python-sphinx python-pip
   python-virtualenv
   python3-sphinx python3-pip
   python3-virtualenv
   postgresql postgresql-client libpq-dev
   manpages-dev
   iftop bmon iptraf nload nethogs speedometer slurm
   iptraf tcptrack vnstat  bwm-ng cbm pktstat netdiag
   ifstat nmon saidar
   jq whois
   nginx
   sam2p tokyotyrant tokyocabinet-bin libtokyotyrant-dev
   postfix
   cmigemo
   mailutils
   curl unzip libsnappy-dev
   qt4-qmake libqt4-dev xvfb
   rlwrap
   meld
   texi2html texinfo
   libcupti-dev
).each do |pkg|
  package pkg do
    action :install
  end
end
