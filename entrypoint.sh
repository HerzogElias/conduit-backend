#!/bin/sh
if [ "$DATABASE" = "postgres" ]
then
    echo "Warte auf Datenbank..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done
    echo "Datenbank ist erreichbar"
fi

python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate
gunicorn conduit.wsgi:application --bind 0.0.0.0:8000