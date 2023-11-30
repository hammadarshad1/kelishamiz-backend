#!/usr/bin/env bash
set -e

cd ./backend/
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --clear --noinput

echo "Starting flower"
exec celery -A kelishamiz flower --address=0.0.0.0 --port=5555