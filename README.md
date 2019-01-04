[![Build Status](https://travis-ci.org/localgod/centos-packer.svg?branch=master)](https://travis-ci.org/localgod/centos-packer)

# CentOS build

Currently this build, using [Packer](https://www.packer.io/), supports building:

-   a [Vagrant](https://www.vagrantup.com/) image for [Virtualbox](https://www.virtualbox.org/) with guest additions installed
-   a [Docker](https://www.docker.com/) image

based on the official [CentOS](https://www.centos.org/) version 7.6.1810 release.

-   [Puppet](https://puppet.com/) support may/removed with `puppet.sh` in the provisioner section.
-   [Gnome](https://www.gnome.org/) support may/removed with `gnome.sh` in the provisioner section. It must be added before `vbox.sh`.

## Prerequisite

Virtualbox, Vagrant, Packer and Docker is installed on build host. This guide assumes that the host is not a virtualbox/vagrant image itself.

## Build

Build vagrant box:

`./make build_vagrant`

Build docker image:

`./make build_vagrant`

## Testing

### Vagrant

A `Vagrantfile` has been included in the repo for testing the build.

Run `vagrant up` to test your new box.

If you do multiple trial builds remember to remove old versions between builds:

`vagrant box remove file://builds/virtualbox-centos7.box`

### Docker

You can test the new Docker images by running:

`docker run -it localgod/centos:7.6.1810 /bin/bash`

## Virtualbox version note

Packer uses the version of Virtualbox installed on the build host for creating the Vagrant box. As a result, guest additions version in the vagrant box will be that of the Virtualbox installation that created the box.
