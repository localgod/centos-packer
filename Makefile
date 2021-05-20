build_docker:
	packer build -force docker.json

build_vagrant:
	packer build -force vagrant.json
