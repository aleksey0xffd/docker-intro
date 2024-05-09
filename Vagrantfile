Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04-arm64"
  config.vm.hostname = "intro"
  config.vm.define "docker-intro"
  config.vm.provider :vmware_desktop do |vmware|
    vmware.cpus = 2
    vmware.vmx["ethernet0.virtualdev"] = "vmxnet3"
    vmware.ssh_info_public = true
    vmware.linked_clone = false
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
