releasever=7.6.1810
basearch=x86_64

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
baseurl=https://mirror.netsite.dk/epel/7/$basearch/
enabled=1
gpgcheck=0

EOF

yum -y -x 'kernel*' update
