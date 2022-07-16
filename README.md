# :hammer_and_wrench: Vagrant Lab

## A multi-machine environment for study ✏️.

## Prereqs:
- VM VirtualBox 
- Vagrant

## Get started:
```
git clone https://github.com/petrick-ribeiro/vagrant-lab.git ~/vagrant-lab
```

### To use the same pair key to acess the nodes
```
cd ~/vagrant-lab && mkdir keys/ && \
ssh-keygen -q -t rsa -f ./keys/vagrant-key -N ''
```

### Bring up the environment :rocket:
```
vagrant up
```
### Destroy the environment 💣
```
vagrant destroy
```
### Boot/ Destroy an specific machine
```
vagrant up <machine name>

vagrant destroy -f <machine name>
``` 
