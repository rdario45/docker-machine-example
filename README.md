# HTML5 CSS3 JS6

Esta aplicacion de ejemplo fue desarrollada unicamente con tecnologias HTML, CSS y Javascript no se apoya en ningun framework o libreria (a excepcion de Vanilla.js) fue desarrollada para desplegar un sitio web dinamico con infraestructura en la nube usando la plataforma de [DigitalOcean]().

## Contenido
 - [Conocimientos previos]()
 - [Ejecucion en ambiente local]()
 - [Instalacion en ambientes remotos]()
 - [Ambiente de 'Desarrollo']()
 - [Ambiente de 'Pruebas']()
 - [Ambiente de 'Produccion']()
 - [Ejecucion de pruebas]()
 - [Autores]()
 - [Licencia]()

## Conocimientos previos
Con el objetivo de entender las tecnologias y procesos que aqui se describen, es necesario tener conocimientos basicos de programacion web con tecnologias como [Html](), [Css]() y [Javascript](). Ademas con procesos de despliegue automaticas de aplicaciones contenizadas con [Docker](), servidores de aplicaciones web como [nginx]() y plataformas de servicios cloud [DigitalOcean]().

## Instalacion en ambientes remotos

### Pre-requisitos

 - #### Generar un token de acceso de digitalocean

  Para proveer la infraestructura necesaria en la plataforma de DigitalOcean es necesario generar un token personal de acceso (personal access token) en tu cuenta de DigitalOcean como lo indica el siguiente  [tutorial](https://www.digitalocean.com/docs/api/create-personal-access-token/).

  Suponiendo que `access_token=91b21f4cdaa0643a6b4f998896830e200d4fd0bc4d12a2a792be3b2e5b10564d` se procedera a usar en los scrips de instalacion como se detalla mas adelante.


  - #### Instlacion de utilidades

  Es necesario tener instalado las herramientas para la automatizacion de despliegue en contenedores [Docker]() antes de poder instalar la aplicacion en cualquiera de sus ambientes.

    - Software requerido:
      - [nodejs](https://nodejs.org/es/)
      - [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
      - [docker-machine](https://docs.docker.com/machine/install-machine/)

    > nota: para la instalacion de nodejs se recomienda hacerlo a traves de la utilidad [nvm](https://github.com/nvm-sh/nvm#installation-and-update)

    las siguientes son versiones verificadas de las herramientas instaladas.

  | package           | version       |
  | -----------       | -----------   |
  | npm               | 6.9.0         |
  | node              | v12.4.0       |
  | docker            | 18.09.6       |
  | docker-machine    | 0.16.0        |
  - #### Instalacion del ambiente

  Para realizar el proceso de instalacion es necesario unicamente ejecutar el script correspondiente al ambiente que desea montar, agregando el acces_token como parametro.

  Ejemplo:
  ```bash
  access_token=91b21f4cdaa0643a6b4f998896830e200d4fd0bc4d12a2a792be3b2e5b10564d &&
  ./bin/install_dev --acces_token $access_token
  ```
  Esto creara la instancia de la maquina remota de ser encesario, copiara algunos archivos del proyecto y ejecutara en ella los scripts necesarios para proveer una infraestructura basica por cada ambiente.

## Ambiente de 'Desarrollo'

Para instalar el ambiente de desarrollo es necesario unicamente ejecutar el siguiente comando:
```bash
access_token=91b21f4cdaa0643a6b4f998896830e200d4fd0bc4d12a2a792be3b2e5b10564d &&
./bin/install_dev --acces_token $access_token
```

> nota: recuerde reemplazar el valor del atributo `acces_token` con el valor correspondiente

## Ambiente de 'Pruebas' o 'Produccion'

De igual forma para instalar los ambientes de pruebas o produccion es necesario ejecutar el script correnpondiente de la siguiente forma para el ambiente de pruebas:

```bash
access_token=91b21f4cdaa0643a6b4f998896830e200d4fd0bc4d12a2a792be3b2e5b10564d &&
./bin/install_qa --acces_token $access_token
```

O para instalar el ambiente productivo:

```bash
access_token=91b21f4cdaa0643a6b4f998896830e200d4fd0bc4d12a2a792be3b2e5b10564d &&
./bin/install_prod --acces_token $access_token
```

## Ejecucion en ambiente local

// TODO

  - ### Ejecucion de pruebas unitarias

  // TODO


## Autores

## Licencia



 To run:

 docker-machine ssh develop rm /root/nginx.conf &&
 docker-machine ssh develop rm -rf /root/html &&
 docker-machine ssh develop docker rm -f webserver &&
 docker-machine scp nginx.conf develop:/root/nginx.conf &&   
 docker-machine scp -r ./html develop:/root/html &&
 docker-machine ssh develop docker run --name webserver -v /root/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /root/html:/usr/share/nginx/html:ro -d -p 80:80 nginx



---
 # HTML5 CSS3 JS6 [English version]
