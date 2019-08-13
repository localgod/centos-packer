# Gnome
yum -y groupinstall "X Window System"
yum -y install gnome-classic-session terminator control-center liberation-mono-fonts
systemctl set-default graphical.target
