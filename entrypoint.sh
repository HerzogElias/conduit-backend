#!/bin/sh
python manage.py makemigrations
python manage.py migrate --noinput

python manage.py createsuperuser \
    --noinput \
    --username "$DJANGO_SUPERUSER_USERNAME" \
    --email "$DJANGO_SUPERUSER_EMAIL" || true



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


python manage.py collectstatic --noinput


gunicorn conduit.wsgi:application --bind 0.0.0.0:8000
