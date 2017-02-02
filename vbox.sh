# Virtualbox
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
yum -y install bzip2 dkms patch perl gcc make gcc perl
yum -y install "kernel-devel-uname-r == $(uname -r)"
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso
