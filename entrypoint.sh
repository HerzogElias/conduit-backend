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

python manage.py createsuperuser \
    --noinput \
    --username "$DJANGO_SUPERUSER_USERNAME" \
    --email "$DJANGO_SUPERUSER_EMAIL" || true

# Passwort setzen/aktualisieren
python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
u, created = User.objects.get_or_create(username='$DJANGO_SUPERUSER_USERNAME', defaults={'email': '$DJANGO_SUPERUSER_EMAIL'});
u.email = '$DJANGO_SUPERUSER_EMAIL';
u.set_password('$DJANGO_SUPERUSER_PASSWORD');
u.is_superuser = True;
u.is_staff = True;
u.save();
print('Superuser ready:', u.username)
"

# Staticfiles sammeln
python manage.py collectstatic --noinput

# Server starten
gunicorn conduit.wsgi:application --bind 0.0.0.0:8000
