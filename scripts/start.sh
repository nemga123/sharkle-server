#!bin/bash

UWSGI_INI=/home/ec2-user/sharkle-server_uwsgi.ini
VIRTUAL_ENV=sharkle-venv
WORKING_DIR=/home/ec2-user/build/sharkle

echo "[Deploy] : Activate virtual env"
pyenv activate $VIRTUAL_ENV

cd $WORKING_DIR

echo "[Deploy] : Migrate"
python managy.py makemigrations
python managy.py migrate

echo "[Deploy] : Running Uwsgi"
uwsgi -i $UWSGI_INI

echo "[Deploy] : Running Nginx"
sudo systemctl start nginx