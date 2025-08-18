#!/bin/sh
if [ "$DATABASE" = "postgres" ]; then
    echo "Warte auf Datenbank..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done
    echo "Datenbank ist erreichbar"
fi

# Migrationen zuerst
python manage.py makemigrations
python manage.py migrate --noinput

# Superuser erstellen oder aktualisieren
python manage.py shell <<EOF
import os
from django.contrib.auth import get_user_model

User = get_user_model()
username = os.environ.get('DJANGO_SUPERUSER_USERNAME', 'admin')
email = os.environ.get('DJANGO_SUPERUSER_EMAIL', 'admin@example.com')
password = os.environ.get('DJANGO_SUPERUSER_PASSWORD', 'adminpassword')

user = User.objects.filter(username=username).first()
if not user:
    print(f"Creating superuser '{username}'...")
    User.objects.create_superuser(username=username, email=email, password=password)
    print(f"Superuser '{username}' created.")
else:
    print(f"Superuser '{username}' already exists, updating credentials...")
    user.email = email
    user.set_password(password)
    user.save()
    print(f"Superuser '{username}' updated.")
EOF

# Staticfiles sammeln
python manage.py collectstatic --noinput

# Server starten
gunicorn conduit.wsgi:application --bind 0.0.0.0:8000
