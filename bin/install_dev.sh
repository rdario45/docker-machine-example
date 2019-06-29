#!/bin/bash

ACCESS_TOKEN=$2
DROPLET_NAME=desarrollo
USER=root

usage() {
  echo -e "\n usage: ./install_dev [--acces_token token] \n"
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
  docker-machine scp ./bin/remote/install.sh $DROPLET_NAME:/$USER/install.sh
  # nginx config
  docker-machine scp ./nginx/nginx.conf $DROPLET_NAME:/$USER/nginx.conf
  # src folder
  docker-machine scp -r ./src $DROPLET_NAME:/$USER/html
}

remote(){
    echo -e "4. Execute remote script."
    docker-machine ssh $DROPLET_NAME sh install.sh
}

resumen() {
  echo -e "5. Ambiente de desarrollo creado."
  docker-machine ip $DROPLET_NAME
}

main() {
  echo -e "\n Instalando ambiente de desarrollo... \n"
  remove
  create
  copy
  remote
  resumen
}

case $1 in
    (--acces_token)
      echo $2
      main
      exit 1
    ;;
    (*)
      usage
      exit 1
    ;;
esac