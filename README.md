# Magento en Docker
## Pasos de instalación
Para lanzar Magento hay que seguir los siguientes pasos:

#### 1. Descargar Magento usando Composer
<code>sudo apt install composer</code>

<code>composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.5-p1 src/</code>

Se guardará en ./src. La versión que se está descargando es la **2.4.5-p1**.

#### 2. Lanzar los servicios
Para ello se usa el archivo **docker-compose.yml**:

<code>docker-compose up -d</code>

En el directorio del proyecto.

#### 3. Instalación de Mangento (con Sample Data)
Para la instalación de Magento entramos en el contenedor phpfpm y **ejecutamos el script ./install.sh** que se encuentra en /var/www/html/ (directorio por defecto del contenedor).

<code>docker-compose exec phpfpm bash</code>

<code>./install.sh</code>

Los parámetros para la instalación de Magento se pueden configurar modificando el script.

