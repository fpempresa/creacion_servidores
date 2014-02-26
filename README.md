# creacion_servidores


Script para la creación de todos los servidores de FPempresa

## Prerequisitos
Es necesario tener instalado el JDK 7 y la herramienta Apache Ant

## Configuracion 
Antes de poder ejecutar el Scrip de cracion de los servidores es necesario definir las siguientes propiedades
en el fichero `proyecto.properties` .Este fichero no existe en el repositirio y debe ser creado manualmente 
con el siguiente contenido:

	OPENSHIFT_PRODUCCION_LOGIN=@fpmislata.com
	OPENSHIFT_PRODUCCION_PASSWORD=

	OPENSHIFT_PREPRODUCCION_LOGIN=@fpmislata.com
	OPENSHIFT_PREPRODUCCION_PASSWORD=

	OPENSHIFT_PRUEBAS_LOGIN=@fpmislata.com
	OPENSHIFT_PRUEBAS_PASSWORD=

	OPENSHIFT_DESARROLLO_LOGIN=@fpmislata.com
	OPENSHIFT_DESARROLLO_PASSWORD=

	OPENSHIFT_LOG_LOGIN=@fpmislata.com
	OPENSHIFT_LOG_PASSWORD=


	GIT_REPOSITORY_APP=https://github.com/fpempresa/fpempresa.git
	GIT_REPOSITORY_JENKINS=https://github.com/fpempresa/servidor_jenkins.git
	GIT_REPOSITORY_SONAR=https://github.com/fpempresa/servidor_sonar.git
	GIT_REPOSITORY_LOGSTASH=https://github.com/fpempresa/servidor_logstash.git
	GIT_REPOSITORY_ELASTICSEARCH=https://github.com/fpempresa/servidor_elasticsearch.git
	GIT_REPOSITORY_KIBANA=https://github.com/fpempresa/servidor_kibana.git

	
	#La contrasenya de los servicios que se instalan , no de los servidores de openshift
	SERVICES_MASTER_PASSWORD=

	
	#OAuth para hacer las copias de seguridad de la base de datos
	GOOGLE_PRODUCCION_CLIENT_ID=
	GOOGLE_PRODUCCION_CLIENT_SECRET=
	GOOGLE_PREPRODUCCION_CLIENT_ID=
	GOOGLE_PREPRODUCCION_CLIENT_SECRET=
	GOOGLE_PRUEBAS_CLIENT_ID=
	GOOGLE_PRUEBAS_CLIENT_SECRET=

	#Copia de seguridad extra por FTP
	FTP_BACKUP_USER=
	FTP_BACKUP_PASSWORD=
	FTP_BACKUP_HOST=
	FTP_BACKUP_FILENAME=
	
## Creacion

En el directorio raiz del proyecto ejecutar:

    ant
