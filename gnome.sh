# Gnome
yum -y groupinstall "X Window System"
yum -y install gnome-classic-session control-center liberation-mono-fonts
yum -y --enablerepo epel install terminator
systemctl set-default graphical.target