#!/bin/bash

echo "Runnig docker nginx"
docker run --name website -v /root/nginx.conf:/etc/nginx/nginx.conf:ro -v /root/html:/usr/share/nginx/html:ro -d -p 80:80 nginx
