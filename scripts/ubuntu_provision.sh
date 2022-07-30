### Provising Ubuntu/Focal64 ###

KEY_PATH='/vagrant/keys'
COMMON_PKGS='wget curl ca-certificates gnupg lsb-release python3-pip unzip htop vim git'
# DOCKER_KEY='https://download.docker.com/linux/ubuntu/gpg'
# DOCKER_KEY_PATH='/etc/apt/keyrings/docker.gpg'
# DOCKER_PKGS='docker-ce docker-ce-cli containerd.io docker-compose-plugin'
# DOCKER_REPO_COMMAND="deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# DOCKER_REPO_PATH='/etc/apt/sources.list.d/docker.list'
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
echo '10.0.10.110 node01.lab' >> /etc/hosts
echo '10.0.10.120 node02.lab' >> /etc/hosts

### Install Packages ###
# mkdir -p /etc/apt/keyrings
# curl -fsSL $DOCKER_KEY | gpg --dearmor -o $DOCKER_KEY_PATH
# echo $DOCKER_REPO_COMMAND | tee $DOCKER_REPO_PATH > /dev/null
DEBIAN_FRONTEND=noninteractive apt-get update > /dev/null
# apt-get upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends $COMMON_PKGS -y > /dev/null
# DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends $DOCKER_PKGS -y > /dev/null
rm -rf /var/apt/lists
rm -rf /var/lib/cache/apt

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
