# creacion_servidores


Script para la creación de todos los servidores de FPempresa

## Prerequisitos
Es necesario tener instalado Git, el JDK 7 y la herramienta Apache Ant

## Configuracion 
Antes de poder ejecutar el Scrip de cracion de los servidores es necesario definir las siguientes propiedades
en el fichero `../private/proyecto.properties` .Este fichero se obtendrá que un repositorio privado.

	#La contrasenya de los servicios que se instalan , no de los servidores de openshift
	SERVICES_MASTER_PASSWORD=
	SERVICES_MASTER_EMAIL=
	PROJECT_NAME=


	OPENSHIFT_PRODUCCION_LOGIN=
	OPENSHIFT_PRODUCCION_PASSWORD=

	OPENSHIFT_PREPRODUCCION_LOGIN=
	OPENSHIFT_PREPRODUCCION_PASSWORD=

	OPENSHIFT_PRUEBAS_LOGIN=
	OPENSHIFT_PRUEBAS_PASSWORD=

    DOMAIN_NAME_PRODUCCION_1=
    DOMAIN_NAME_PRODUCCION_2=
    DOMAIN_NAME_PRODUCCION_3=
    DOMAIN_NAME_PRODUCCION_4=
    
    DOMAIN_NAME_PREPRODUCCION_1=
    DOMAIN_NAME_PREPRODUCCION_2=
    DOMAIN_NAME_PREPRODUCCION_3=
    DOMAIN_NAME_PREPRODUCCION_4=
    
    DOMAIN_NAME_PRUEBAS_1=
    DOMAIN_NAME_PRUEBAS_2=
    DOMAIN_NAME_PRUEBAS_3=
    DOMAIN_NAME_PRUEBAS_4=
	
	
	GIT_REPOSITORY_APP=https://github.com/fpempresa/servidor_aplicacion.git
	GIT_REPOSITORY_JENKINS=https://github.com/fpempresa/servidor_jenkins.git
	#La URL de este mismo repositorio pero con usuario y contrasenya
	GIT_REPOSITORY_PRIVATE=https://usuario:contrasenya@url.git

    GIT_REPOSITORY_SOURCE_CODE_1=https://github.com/fpempresa/fpempresa.git
    GIT_REPOSITORY_SOURCE_CODE_2=https://github.com/logongas/ix3.git
    GIT_REPOSITORY_SOURCE_CODE_3=https://github.com/logongas/ix3security.git
    GIT_REPOSITORY_SOURCE_CODE_4=https://github.com/logongas/ix3web.git
    GIT_REPOSITORY_SOURCE_CODE_5=
    GIT_REPOSITORY_SOURCE_CODE_6=
    GIT_REPOSITORY_SOURCE_CODE_7=
    GIT_REPOSITORY_SOURCE_CODE_8=
    GIT_REPOSITORY_SOURCE_CODE_9=
    
	#Este directorio debe tener el mismo valor que PROJECT_NAME
    TARGET_DIR_REPOSITORY_SOURCE_CODE_1=fpempresa
    TARGET_DIR_REPOSITORY_SOURCE_CODE_2=ix3
    TARGET_DIR_REPOSITORY_SOURCE_CODE_3=ix3security
    TARGET_DIR_REPOSITORY_SOURCE_CODE_4=ix3web
    TARGET_DIR_REPOSITORY_SOURCE_CODE_5=
    TARGET_DIR_REPOSITORY_SOURCE_CODE_6=
    TARGET_DIR_REPOSITORY_SOURCE_CODE_7=
    TARGET_DIR_REPOSITORY_SOURCE_CODE_8=
    TARGET_DIR_REPOSITORY_SOURCE_CODE_9=

	#Copia de seguridad por FTP
	FTP_BACKUP_USER=
	FTP_BACKUP_PASSWORD=
	FTP_BACKUP_HOST=
	FTP_BACKUP_ROOT_PATH=

	#newrelic
	NEW_RELIC_LICENSE_KEY=
	
	
	#logentries
	LOGENTRIES_LICENSE_KEY=

	LOGENTRIES_PRODUCCION_HOST_KEY=
	LOGENTRIES_PREPRODUCCION_HOST_KEY=
	LOGENTRIES_PRUEBAS_HOST_KEY=

## Variable de entorno
Es ncesario crear la variable de entorno `APP_ENVIRONMENT` con el valor del entorno en el que estamos.
Los posibles valores son `PRODUCCION` , `PREPRODUCCION` o `PRUEBAS`

Por ejemplo en Windows ejecutar

	APP_ENVIRONMENT=PRODUCCION
	
Por ejemplo en Linux ejecutar

	export APP_ENVIRONMENT=PREPRODUCCION
	
## Creacion

En el directorio raiz del proyecto ejecutar:

Windows

    ant.bat

Linux

	./ant.sh
	
## New Relic
Es necesario obtener el valor de la clave de la licencia de New Relic en la propia pagina

##Logentries
Es necesario crear previamente los servidores `app-pro$PROJECT_NAME` , `app-pre$PROJECT_NAME` y `app-pru$PROJECT_NAME`
Obteniendo las claves de los servidores. Está en la URL en el parametro `id`.

Tambien es necesaria la licencia del usuario.

