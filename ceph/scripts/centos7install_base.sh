




yum install ntp ntpdate ntp-doc openssh-server






# FIREWALL: open 6789 for Ceph Monitors and ports 6800:7300 for Ceph OSDs
#on monitors:

sudo firewall-cmd --zone=public --add-service=ceph-mon --permanent

#and on OSDs and MDSs:

sudo firewall-cmd --zone=public --add-service=ceph --permanent

sudo firewall-cmd --reload




# SELINUX

yum install setools-console  -y





sudo useradd -d /home/ceph-deploy -m ceph-deploy
sudo passwd ceph-deploy
#TTY
# On CentOS and RHEL, you may receive an error while trying to execute ceph-deploy commands.
# If requiretty is set by default on your Ceph nodes, disable it by executing sudo visudo and locate the Defaults requiretty setting. Change it to Defaults:ceph !requiretty or comment it out to ensure that ceph-deploy can connect using the user
# Note If editing, /etc/sudoers, ensure that you use sudo visudo rather than a text editor.
deploy ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ceph echo "Defaults:ceph-deploy !requiretty" | sudo tee -a /etc/sudoers.d/ceph

#on ADMIN

su - ceph-deploy
ssh-keygen -t rsa