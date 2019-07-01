#!/bin/bash

echo "Runnig docker nginx"
docker run --name website -v /root/website/nginx.conf:/etc/nginx/nginx.conf:ro -v /root/website/src:/usr/share/nginx/html:ro -d -p 80:80 nginx
