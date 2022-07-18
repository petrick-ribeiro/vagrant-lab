### Provising CentOS/7 ###

KEY_PATH='/vagrant/keys'
COMMON_PKGS='wget curl tree htop vim git'
DOCKER_PKGS='docker-ce docker-ce-cli containerd.io docker-compose-plugin'
DOCKER_REPO='https://download.docker.com/linux/centos/docker-ce.repo'
COMPOSE_FILE_PATH='/usr/local/bin/docker-compose'
COMPOSE_URL_PATH="https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-$(uname -s)-$(uname -m)"

### Set ssh key ###
mkdir -p /root/.ssh
cp $KEY_PATH/vagrant-key /root/.ssh/id_rsa
cp $KEY_PATH/vagrant-key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/vagrant-key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

### Install Packages ###
# yum update -y > /dev/null
yum install epel-release yum-utils -y > /dev/null
yum-config-manager --add-repo $DOCKER_REPO
yum install $COMMON_PKGS $DOCKER_PKGS -y > /dev/null

# Convenience Script Docker (dev)
# curl -fsSL https://get.docker.com | bash

curl -L $COMPOSE_URL_PATH -o $COMPOSE_FILE_PATH

### Post-install ###
systemctl start docker
systemctl enable docker
chmod 755 $COMPOSE_FILE_PATH
groupadd docker
usermod -aG docker $USER
