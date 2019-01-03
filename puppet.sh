releasever=7.6.1810
basearch=x86_64

# Add repos
cat << EOF > /etc/yum.repos.d/puppet.repo
[puppetlabs]
name=puppetlabs
baseurl=http://yum.puppetlabs.com/el/7/products/$basearch/
enabled=1
gpgcheck=0

[puppetlabs-dependencies]
name=puppetlabs-dependencies
baseurl=http://yum.puppetlabs.com/el/7/dependencies/$basearch/
enabled=1
gpgcheck=0

EOF

# Puppet
yum install -y puppet
