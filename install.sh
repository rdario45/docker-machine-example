#!/bin/zsh
echo "Installing..."


docker-machine ssh develop rm /root/nginx.conf

docker-machine ssh develop rm -rf /root/html

docker-machine ssh develop docker rm -f webserver

docker-machine scp nginx.conf develop:/root/nginx.conf

docker-machine scp -r ./html develop:/root/html

docker-machine ssh develop docker run --name webserver -v /root/nginx.conf:/etc/nginx/nginx.conf:ro \
 -v /root/html:/usr/share/nginx/html:ro -d -p 80:80 nginx
