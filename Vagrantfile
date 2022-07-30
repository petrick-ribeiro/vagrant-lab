# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
  'master' => { 'memory' => '2048', 'cpu' => '2', 'ip' => '100', 'image' => 'ubuntu/focal64' },
  'node01' => { 'memory' => '1024', 'cpu' => '2', 'ip' => '110', 'image' => 'ubuntu/focal64' },
  'node02' => { 'memory' => '1024', 'cpu' => '2', 'ip' => '120', 'image' => 'centos/7' },
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
        vb.customize ['modifyvm', :id, '--groups', '/LAB']
      end

      if "#{conf['image']}" == 'ubuntu/focal64'
        machine.vm.provision 'shell', path: 'scripts/ubuntu_provision.sh'
      else
        machine.vm.provision 'shell', path: 'scripts/centos_provision.sh'
      end

      machine.vm.provision 'shell', inline: "hostnamectl set-hostname #{name}.lab"

    end
  end
end
