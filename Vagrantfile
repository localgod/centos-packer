Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.hostname = "virtualbox-centos7"
  config.vm.box = "file://builds/virtualbox-centos7.box"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--vram", "256"]
    vb.customize ["modifyvm", :id, "--usb", "off"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--usbehci", "off"]
  end
end
