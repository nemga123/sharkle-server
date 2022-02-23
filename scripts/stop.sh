#!bin/bash

UWSGI_INI=/home/ec2-user/sharkle-server_uwsgi.ini
VIRTUAL_ENV=sharkle-venv
LOG_DIR=/home/ec2-user/sharkle_uwsgi.log

export PATH=/home/ec2-user/.pyenv/bin:/home/ec2-user/.pyenv/plugins/pyenv-virtualenv/shims:/home/ec2-user/.pyenv/shims:/home/ec2-user/.pyenv/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ec2-user/.local/bin:/home/ec2-user/bin
source /home/ec2-user/.bashrc

echo "[Deploy] : Activate virtual env"
pyenv activate $VIRTUAL_ENV

echo "[Deploy] : Stop Nginx"
sudo systemctl stop nginx

echo "[Deploy] : Reset Log"
uwsgi --stop /tmp/sharkle_uwsgi.pid
