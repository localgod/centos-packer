build_docker:
	packer build -force -except=vagrant packer-template.json

build_vagrant:
	packer build -force -except=docker packer-template.json
