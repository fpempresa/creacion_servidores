# Instalar OpenShift Origin
Pasos para instalar openShift Origin en un VPS de OVH (aunque deber�a valer para cualquier VPS)

```
#Nueva contrase�a del VPS pq tiene la de por defecto
passwd
yum -y install git
git clone https://github.com/fpempresa/creacion_servidores.git
cd creacion_servidores/openshift_origin
./step1.sh
cd creacion_servidores/openshift_origin
./step2.sh
```