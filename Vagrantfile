VAGRANTFILE_API_VERSION = "2"

# This file provides a Vagrant environment to test salt formulas in a master-
# less environment
#
# * Ubuntu 12.04, minion "ubuntu1204"
# * Ubuntu 14.04, minion "ubuntu1404"
# * CentOS 6.5, minion "centos65"
# * CentOS 7rc, minion "centos7rc"

VMS = [
  {
    name: 'ubuntu1204',
    box: 'ubuntu/precise64',
    hostonly_ip: '192.168.56.20',
    intnet_ip: '172.16.32.20',
    memory: 1024,
    cpus: 2,
    synced_folders: [ { src: 'saltstack/', tgt: '/srv/saltstack'} ]
  },
  {
    name: 'ubuntu1404',
    box: 'ubuntu/trusty64',
    hostonly_ip: '192.168.56.21',
    intnet_ip: '172.16.32.21',
    memory: 1024,
    cpus: 2,
    synced_folders: [ { src: 'saltstack/', tgt: '/srv/saltstack'} ]
  },
  {
    name: 'centos65',
    box: 'chef/centos-6.5',
    hostonly_ip: '192.168.56.22',
    intnet_ip: '172.16.32.22',
    memory: 1024,
    cpus: 2,
    synced_folders: [ { src: 'saltstack/', tgt: '/srv/saltstack'} ]
  },
  {
    name: 'centos7rc',
    box: 'pavel-sakun/centos7rc-20140614-x64',
    hostonly_ip: '192.168.56.23',
    intnet_ip: '172.16.32.23',
    memory: 1024,
    cpus: 2,
    synced_folders: [ { src: 'saltstack/', tgt: '/srv/saltstack'} ]
  }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  VMS.each do |minion|
    config.vm.define minion[:name] do |host|
      host.vm.box = minion[:box]
      host.vm.network "private_network", ip: minion[:hostonly_ip]
      host.vm.network "private_network", ip: minion[:intnet_ip], virtualbox__intnet: true
      host.vm.hostname = minion[:name]
      host.vm.provider "virtualbox" do |v|
        v.memory = minion[:memory]
        v.cpus = minion[:cpus]
      end
      if minion[:synced_folders] then
        minion[:synced_folders].each do |folder|
          host.vm.synced_folder folder[:src], folder[:tgt]
        end
      end
      host.vm.provision :salt do |salt|
        salt.minion_config = "saltstack/minion"
        salt.run_highstate = true
      end
    end
  end
end
