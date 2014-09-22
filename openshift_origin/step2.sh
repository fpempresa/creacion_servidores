enforced=$(getenforce)
if [ "$enforced" !=  "Permissive" ]; then
  echo "ERROR:No esta habilitado SELinux!!!!!!!!!!!!!!!!!!!!"
  exit
fi

rm -f kernel-firmware-2.6.32-431.29.2.el6.centos.plus.noarch.rpm
rm -f kernel-2.6.32-431.29.2.el6.centos.plus.x86_64.rpm

yum -y install unzip curl
yum clean all
yum check-update
yum update


rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install puppet



sh <(curl -s https://install.openshift.com/) 


yum -y install java-1.7.0-openjdk-devel.x86_64

yum -y install tomcat-native.x86_64

####### Instalar Tomcat 6 y 7 https://github.com/danilko/openshift-origin-3-jbossews-cartridge-installation
wget http://apache.rediris.es/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz
tar -xvf apache-tomcat-7.0.55.tar.gz
cp -rf apache-tomcat-7.0.55 /etc/alternatives/jbossews-2.0
rm -rf apache-tomcat-7.0.55
rm -f  apache-tomcat-7.0.55.tar.gz


wget http://apache.rediris.es/tomcat/tomcat-6/v6.0.41/bin/apache-tomcat-6.0.41.tar.gz
tar -xvf apache-tomcat-6.0.41.tar.gz
cp -rf apache-tomcat-6.0.41 /etc/alternatives/jbossews-1.0
rm -rf apache-tomcat-6.0.41
rm -f  apache-tomcat-6.0.41.tar.gz


####### Instalar MAVEN https://github.com/danilko/openshift-origin-3-jbossews-cartridge-installation
wget ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz
tar -xvf apache-maven-3.2.3-bin.tar.gz
cp -rf apache-maven-3.2.3 /etc/alternatives/maven
rm -rf apache-maven-3.2.3
rm -f apache-maven-3.2.3-bin.tar.gz
echo -e 'export M2_HOME=/etc/alternatives/maven\nexport PATH=${M2_HOME}/bin:${PATH}'  > /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -v

####### Instalar el cartucho de Tomcat 7
git clone https://github.com/openshift/origin-server.git
cp -rf origin-server/cartridges/openshift-origin-cartridge-jbossews /usr/libexec/openshift/cartridges/jbossews
rm -rf origin-server

chmod a+x /usr/libexec/openshift/cartridges/jbossews/bin/*
oo-admin-cartridge -a install -s /usr/libexec/openshift/cartridges/jbossews
oo-admin-broker-cache -c
oo-admin-ctl-cartridge -c import-node --activate
/var/www/openshift/broker/script/rails console << EOF
Rails.cache.clear
quit
EOF


while : ; do

        echo "Escribe el nombre de la cuenta a crear en openshift origin. [ENTER] para acabar:"
        read account

        if [ "$account" == "" ]; then
                break
        else
                htpasswd -c /etc/openshift/htpasswd $account
        fi
done


#newrelic
echo "license_key de newrelic para monitorizar el servidor. [ENTER] para NO monitorizarlo:"
read licensekey
if [ "$licensekey" != "" ]; then
	rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
	yum install -y newrelic-sysmond
	nrsysmond-config --set license_key=$licensekey
	/etc/init.d/newrelic-sysmond start
fi

echo "Recuerda:"
echo "Consola de administracion  http://localhost:8080/admin-console/ y con redirect de puertos SSH"
echo "Esto del proxy  http://app/haproxy-status y con redirect de puertos SSH"
echo ""
echo "Pulsa [ENTER] para reiniciar el servidor"
read
reboot
