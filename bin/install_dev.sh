#!/bin/bash

ACCESS_TOKEN=$2
DROPLET_NAME=desarrollo
USER=root

usage() {
  echo -e "\n usage: ./install_dev [--create|--update] [--acces_token token] \n"
}

remove() {
  echo -e "1. Removiendo el Droplet anterior con nombre: $DROPLET_NAME."
  docker-machine rm -f $DROPLET_NAME
}

create() {
  echo -e "2. Creando el nuevo Droplet $DROPLET_NAME."
  docker-machine create --driver digitalocean --digitalocean-image ubuntu-18-04-x64 --digitalocean-region nyc3 --digitalocean-size s-1vcpu-1gb --digitalocean-ssh-port 22 --digitalocean-ssh-user $USER --digitalocean-access-token $ACCESS_TOKEN $DROPLET_NAME
}

copy() {
  echo -e "3. Copiando archivos del proyecto a $DROPLET_NAME."
  # pos install script
  docker-machine scp -d ./bin/remote/install.sh $DROPLET_NAME:/$USER/install.sh
  # nginx config
  docker-machine scp -d ./nginx/nginx.conf $DROPLET_NAME:/$USER/nginx.conf
  # src folder
  docker-machine scp -r -d ./src $DROPLET_NAME:/$USER/html
}

remote(){
  echo -e "4. Ejecutando el script de instalacion remoto."
  docker-machine ssh $DROPLET_NAME sh install.sh
}

#domain() {
#  echo -e "5. Creando el Domain Record para $DROPLET_NAME."
#}

main() {
  echo -e "\n Instalando ambiente de desarrollo... \n"
  remove
  create
  copy
  remote
  #domain
  echo -e "\n Ambiente de desarrollo instalado! \n"

}

case $1 in
    (--acces_token)
      main
      exit 1
    ;;
    (*)
      usage
      exit 1
    ;;
esac
