#!bin/bash

UWSGI_INI=/home/ec2-user/sharkle-server_uwsgi.ini
VIRTUAL_ENV=sharkle-venv
LOG_DIR=/home/ec2-user/sharkle_uwsgi.log

echo "[Deploy] : Stop Nginx"
sudo systemctl stop nginx
