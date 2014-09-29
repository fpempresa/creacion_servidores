wget http://mirror.centos.org/centos/6.5/centosplus/x86_64/Packages/kernel-firmware-2.6.32-431.29.2.el6.centos.plus.noarch.rpm
wget http://mirror.centos.org/centos/6.5/centosplus/x86_64/Packages/kernel-2.6.32-431.29.2.el6.centos.plus.x86_64.rpm

rpm -ivh kernel-firmware-2.6.32-431.29.2.el6.centos.plus.noarch.rpm
rpm -ivh kernel-2.6.32-431.29.2.el6.centos.plus.x86_64.rpm

yum -y upgrade kernel
sed -i -e  "s/^SELINUX=disabled$/SELINUX=permissive/g" /etc/selinux/config

reboot
