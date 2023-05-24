# Create and provision lab infrastructure

SSH_KEY_PATH=./keys/
KEY_NAME=vagrant-key
PUBLIC_KEY_NAME=vagrant-key.pub
PROVISION_PATH=./provision/

all: ssh up provision

ssh:
	mkdir keys
	ssh-keygen -q -t rsa -f $(SSH_KEY_PATH)$(KEY_NAME) -N ''
	chmod 700 $(SSH_KEY_PATH)
	chmod	600	$(SSH_KEY_PATH)$(KEY_NAME)
	chmod	644	$(SSH_KEY_PATH)$(PUBLIC_KEY_NAME)

up: ssh
	vagrant up

provision: ssh up
	cd $(PROVISION_PATH) &&\
	ansible-playbook site.yml -i hosts

destroy:
	vagrant destroy -f
	rm -rf $(SSH_KEY_PATH)
