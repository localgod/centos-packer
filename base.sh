VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

# Yum
rm /etc/yum.repos.d/*
cat << EOF > /etc/yum.repos.d/allowed.repo
[base]
name=CentOS-$releasever - Base
baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
enabled=1
gpgcheck=0

[updates]
name=CentOS-$releasever - Updates
baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
enabled=1
gpgcheck=0

[epel]
name=epel
baseurl=http://mirrors.telianet.dk/epel/7/x86_64/
enabled=1
gpgcheck=0

[puppetlabs]
name=puppetlabs
baseurl=http://yum.puppetlabs.com/el/7/products/x86_64/
enabled=1
gpgcheck=0

[puppetlabs-dependencies]
name=puppetlabs-dependencies
baseurl=http://yum.puppetlabs.com/el/7/dependencies/x86_64/
enabled=1
gpgcheck=0

[nodejs]
name=nodejs
baseurl=https://rpm.nodesource.com/pub_7.x/el/7/x86_64/
enabled=1
gpgcheck=0
EOF

yum -y update

# Virtualbox
yum -y install bzip2 dkms patch perl gcc make kernel-devel gcc perl
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

# Vagrant
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
date > /etc/vagrant_box_build_time

mkdir -pm 700 /home/vagrant/.ssh
cat << EOF > /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOF
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Puppet
yum install -y puppet

# Cleanup
yum autoremove
yum -y install yum-utils
package-cleanup --oldkernels
yum -y remove yum-utils
yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/rubygems-*
