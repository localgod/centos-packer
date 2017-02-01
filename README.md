# CentOS vagrant box

Currently this build, using [Packer](https://www.packer.io/), supports building a [Vagrant](https://www.vagrantup.com/) image for [Virtualbox](https://www.virtualbox.org/) with guest additions installed based on the [CentOS](https://www.centos.org/) version 7 minimal installation ISO.

[Puppet](https://puppet.com/) is pre-installed. See `base.sh` for details.

## Prerequisite

Virtualbox and Vagrant is installed on build host. This guide assumes the host is running Windows as OS and that the host is not a virtualbox/vagrant image itself.

## Build

Download packer:

`curl https://releases.hashicorp.com/packer/0.12.2/packer_0.12.2_windows_amd64.zip -o packer_0.12.2_windows_amd64.zip`

Build vagrant box:

`./packer.exe build -force packer-template.json`

## Testing

A `Vagrantfile` has been included in the repo for testing the build.

Run `vagrant up` to test your new box.

If you do multiple trial builds remember to remove old versions between builds:

`vagrant box remove file://builds/virtualbox-centos7.box`

## Virtualbox version note

Packer uses the version of Virtualbox installed on the build host for creating the box. As a result, guest additions version in the vagrant box
will be that of the Virtualbox installation that created the box.
