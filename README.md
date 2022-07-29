# :hammer_and_wrench: Vagrant Lab

## A multi-machine environment for study ✏️.

## Prereqs:
- [VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads)

## Getting started:
### Clone the repo to /home:
``` shell
git clone https://github.com/petrick-ribeiro/vagrant-lab.git ~/vagrant-lab
```

### Generate the keys:
``` shell
cd ~/vagrant-lab && mkdir keys/ && \
ssh-keygen -q -t rsa -f ./keys/vagrant-key -N ''
```
> To use the same pair key to acess the nodes.

### Bring up the environment :rocket:
``` shell
vagrant up
```
### Destroy the environment 💣
``` shell
vagrant destroy
```
---

### Boot / Destroy an specific machine:
``` shell
vagrant up <machine name>

vagrant destroy -f <machine name>
``` 
