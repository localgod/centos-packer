# Cleanup
yum autoremove
yum -y install yum-utils
package-cleanup --oldkernels
yum -y remove yum-utils
yum -y erase freetype
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/rubygems-*
