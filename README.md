# CentOS build

Currently this build, using [Packer](https://www.packer.io/), supports building:

- a [Vagrant](https://www.vagrantup.com/) image for [Virtualbox](https://www.virtualbox.org/) with guest additions installed
- a [Docker](https://www.docker.com/) image

based on the official [CentOS](https://www.centos.org/) version 7.3.1611 release.

[Puppet](https://puppet.com/) is pre-installed. See `base.sh` for details.

## Prerequisite

Virtualbox, Vagrant and Docker is installed on build host. This guide assumes that the host is not a virtualbox/vagrant image itself.

## Build

- [Download Packer](https://www.packer.io/downloads.html)

Build vagrant box:

`./packer build -force packer-template.json`

## Testing

### Vagrant

A `Vagrantfile` has been included in the repo for testing the build.

Run `vagrant up` to test your new box.

If you do multiple trial builds remember to remove old versions between builds:

`vagrant box remove file://builds/virtualbox-centos7.box`

### Docker

You can test the new Docker images by running:

`docker run -it localgod/centos:7.3.1611 /bin/bash`

## Virtualbox version note

Packer uses the version of Virtualbox installed on the build host for creating the Vagrant box. As a result, guest additions version in the vagrant box will be that of the Virtualbox installation that created the box.
