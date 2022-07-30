### Provising CentOS/7 ###

KEY_PATH='/vagrant/keys'
COMMON_PKGS='wget curl tree unzip htop vim git'
# DOCKER_PKGS='docker-ce docker-ce-cli containerd.io docker-compose-plugin'
# DOCKER_REPO='https://download.docker.com/linux/centos/docker-ce.repo'
# COMPOSE_FILE_PATH='/usr/local/bin/docker-compose'
# COMPOSE_URL_PATH="https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-$(uname -s)-$(uname -m)"
# TERRAFORM_ZIP_PATH='/tmp/terraform.zip'
# TERRAFORM_URL='https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_linux_amd64.zip'

### Set ssh key ###
mkdir -p /root/.ssh
cp $KEY_PATH/vagrant-key /root/.ssh/id_rsa
cp $KEY_PATH/vagrant-key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/vagrant-key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

### Networking ###
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts

echo '10.0.10.100 manager.lab' >> /etc/hosts
echo '10.0.10.110 worker01.lab' >> /etc/hosts
echo '10.0.10.120 worker02.lab' >> /etc/hosts

### Install Packages ###
# yum update -y > /dev/null
yum install epel-release yum-utils -y > /dev/null
# yum-config-manager --add-repo $DOCKER_REPO
yum install $COMMON_PKGS -y > /dev/null
# yum install $DOCKER_PKGS -y > /dev/null

# Convenience Script Docker (dev)
# curl -fsSL https://get.docker.com | bash

# curl -L $COMPOSE_URL_PATH -o $COMPOSE_FILE_PATH

# Terraform Installation
# wget -qO $TERRAFORM_ZIP_PATH $TERRAFORM_URL
# unzip $TERRAFORM_ZIP_PATH -d /usr/local/bin/
# rm $TERRAFORM_ZIP_PATH

### Post-install ###
# systemctl start docker
# systemctl enable docker
# chmod 755 $COMPOSE_FILE_PATH
