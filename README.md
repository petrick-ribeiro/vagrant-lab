# :hammer_and_wrench: Vagrant Lab

## A multi-machine environment for study ✏️.

## Prereqs:
- [VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Getting started:
### Clone the repo:
``` shell
git clone https://github.com/petrick-ribeiro/vagrant-lab.git
```

### Bring up the environment :rocket:
``` shell
make all
```
> Settings:
> - Kubernetes Cluster
> - SSH key pair that connects to all nodes.
### Destroy the environment 💣
``` shell
make destroy
```
---

### Start / Destroy an specific machine without provision:
``` shell
vagrant up <machine name>

vagrant destroy -f <machine name>
``` 
> Environment:
> - **master** (Primary Node - Control Plane)
> - **worker01** (Worker Node)
> - **worker02** (Worker Node)
