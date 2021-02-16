#!/bin/sh

apt update -y
apt install nginx -y > /tmp/nginx.log
systemctl enable --now nginx