# Gnome
yum -y groupinstall "X Window System"
yum -y install gnome-classic-session gnome-terminal control-center liberation-mono-fonts
systemctl set-default graphical.target
