KEY_PATH='/vagrant/keys'

mkdir -p /root/.ssh
cp $KEY_PATH/vagrant-key /root/.ssh/id_rsa
cp $KEY_PATH/vagrant-key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/vagrant-key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
