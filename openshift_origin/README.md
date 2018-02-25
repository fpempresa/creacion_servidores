# Instalar OpenShift Origin
Pasos para instalar openShift Origin en un VPS de OVH (aunque debería valer para cualquier VPS)

```
#Nueva contraseña del VPS pq tiene la de por defecto
passwd

#Ir al fichero "/etc/yum.repos.d/CentOS-Base.repo" y quitar todos los comentarios de las propiedades "mirrorlist=" Porque ya no funcionan los repos de OVH
vi /etc/yum.repos.d/CentOS-Base.repo

#instalar git
yum -y install git


#Es por un error de git con github el 25/02/2018 . https://stackoverflow.com/questions/48938385/github-unable-to-access-ssl-connect-error
yum update -y nss curl libcurl

#Actualizar la version de git a la 1.9.1
yum install gettext-devel expat-devel curl-devel zlib-devel openssl-devel
cd /usr/local/src
wget https://www.kernel.org/pub/software/scm/git/git-1.9.1.tar.gz
tar xzvf git-1.9.1.tar.gz
cd git-1.9.1
make prefix=/usr/local all
make prefix=/usr/local install
git --version


git clone https://github.com/fpempresa/creacion_servidores.git
cd creacion_servidores/openshift_origin
./step1.sh
cd creacion_servidores/openshift_origin
./step2.sh
```
