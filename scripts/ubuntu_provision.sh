### Provising Ubuntu/Bionic64 ###

KEY_PATH='/vagrant/vagrant-keys'
COMMON_PKGS='wget curl ca-certificates gnupg lsb-release htop vim git ansible'
DOCKER_KEY='https://download.docker.com/linux/ubuntu/gpg'
DOCKER_KEY_PATH='/etc/apt/keyrings/docker.gpg'
DOCKER_PKGS='docker-ce docker-ce-cli containerd.io docker-compose-plugin'
DOCKER_REPO_COMMAND="deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
DOCKER_REPO_PATH='/etc/apt/sources.list.d/docker.list'
COMPOSE_FILE_PATH='/usr/local/bin/docker-compose'
COMPOSE_URL_PATH="https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-$(uname -s)-$(uname -m)"

### Set ssh key ###
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

### Install Packages ###
mkdir -p /etc/apt/keyrings
curl -fsSL $DOCKER_KEY | gpg --dearmor -o $DOCKER_KEY_PATH
echo $DOCKER_REPO_COMMAND | tee $DOCKER_REPO_PATH > /dev/null
DEBIAN_FRONTEND=noninteractive apt-get update
apt-get upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install $COMMON_PKGS $DOCKER_PKGS -y

# Convenience Script Docker (dev)
#curl -fsSL https://get.docker.com | bash

curl -L $COMPOSE_URL_PATH -o $COMPOSE_FILE_PATH

### Post-install ###
systemctl start docker
systemctl enable docker
chmod 755 $COMPOSE_FILE_PATH
groupadd docker
usermod -aG docker $USER
