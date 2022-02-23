#!bin/bash

UWSGI_INI=/home/ec2-user/sharkle-server_uwsgi.ini
VIRTUAL_ENV=sharkle-venv
LOG_DIR=/home/ec2-user/sharkle_uwsgi.log

echo $PATH

echo "[Deploy] : Activate virtual env"
pyenv activate $VIRTUAL_ENV

echo "[Deploy] : Stop Nginx"
sudo systemctl stop nginx

echo "[Deploy] : Reset Log"
uwsgi --stop /tmp/sharkle_uwsgi.pid
rm $LOG_DIR
