# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
  # 'master' => { 'memory' => '1024', 'cpu' => '2', 'ip' => '100', 'image' => 'geerlingguy/ubuntu1804' },
  'node01' => { 'memory' => '1024', 'cpu' => '2', 'ip' => '110', 'image' => 'geerlingguy/ubuntu1804' },
  'node02' => { 'memory' => '1024', 'cpu' => '2', 'ip' => '120', 'image' => 'geerlingguy/centos7' }
}

Vagrant.configure('2') do |config|
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf['image']}"
      machine.vm.hostname = "#{name}.lab"
      machine.vm.network 'private_network', ip: "10.0.10.#{conf['ip']}"
      machine.vm.provider 'virtualbox' do |vb|
        vb.gui = false
        vb.name = "#{name}"
        vb.memory = conf['memory']
        vb.cpus = conf['cpu']
        vb.customize ['modifyvm', :id, '--groups', '/Docker-Study']
      end
      if "#{conf['image']}" == 'geerlingguy/ubuntu1804'
        machine.vm.provision 'shell', path: 'scripts/ubuntu_provision.sh'
      else
        machine.vm.provision 'shell', path: 'scripts/centos_provision.sh'
      end
      machine.vm.provision 'shell', inline: "hostnamectl set-hostname #{name}.lab"
    end
  end
end
