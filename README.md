# ![Django DRF Example App](project-logo.png)

> ### Example Django DRF codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld-example-apps) API spec.

<a href="https://thinkster.io/tutorials/django-json-api" target="_blank"><img width="454" src="https://raw.githubusercontent.com/gothinkster/realworld/master/media/learn-btn-hr.png" /></a>

This repo is functionality complete — PR's and issues welcome!

1. [Quickstart](#Quickstart)
2. [Usage](#Usage)
     - [Creating Superuser](#Creating-Superuser)
     - [Installation](#Installation)


## Quickstart 
1. Clone the Following Repository: 
```bash
git clone git@github.com:HerzogElias/conduit-backend.git
```

2. Navigate to the Correct Directory: 
```bash
cd conduit-backend
```

3. Copy your env File: 
```bash
cp example.env .env
```

4. Build a Docker Image: 
```bash
docker build -t conduit_backend .
```

5. Run your Docker Image: 
```bash 
docker run -it --rm --name conduit-backend -p 8025:8000 conduit-backend
```

6. Your Backend is aviable on: 
```bash
<localhost:8025>
```
Gratulations! Your Backend is running. 

## Usage 
### Environment-Variables:
On this Project you have the following environment Variables :
```bash
SECRET_KEY
ALLOWED_HOSTS
DJANGO_SUPERUSER_USERNAME
DJANGO_SUPERUSER_EMAIL
DJANGO_SUPERUSER_PASSWORD
```

You have the following Defaults : 
```bash
SECRET_KEY=th(5#97o4v$+z$+)b%*&juzv49xp%2(m6$7(!xb)i0cliu+wkc
ALLOWED_HOSTS=127.0.0.1
DJANGO_SUPERUSER_USERNAME=admili356
DJANGO_SUPERUSER_EMAIL=admintest@admintest.de
DJANGO_SUPERUSER_PASSWORD=dertest.dwDQYC
```
Attention: Please never use the Default Env Configuration. This is not a Safty Solution.! 
### Creating-Superuser
1. Go to Docker exec in your Docker Container with 
    ```
    docker exec <container-id> bin/bash
    ```

2. Create a new Superuser for Django Admin Panel: 
    ```
    python manage.py createsuperuser
    ```
    Added a username and a safty password and safe. 

3. Navigate to Django Admin Panel and Log in with your Created Superuser Account. 
    ```
    <localhost>/admin
    ```
### Installation 
#### Installation with Local Venv 
1. Clone the Following Repository: 
```bash
git clone git@github.com:HerzogElias/conduit-backend.git
```
2. `cd` into `conduit-django`: `cd productionready-django-api`.
3. Install [pyenv](https://github.com/yyuu/pyenv#installation).
4. Install [pyenv-virtualenv](https://github.com/yyuu/pyenv-virtualenv#installation).
5. Install Python 3.5.2: `pyenv install 3.5.2`.
6. Create a new virtualenv called `productionready`: `pyenv virtualenv 3.5.2 productionready`.
7. Set the local virtualenv to `productionready`: `pyenv local productionready`.
8. Reload the `pyenv` environment: `pyenv rehash`.

If all went well then your command line prompt should now start with `(productionready)`.

If your command line prompt does not start with `(productionready)` at this point, try running `pyenv activate productionready` or `cd ../productionready-django-api`. 

If pyenv is still not working, visit us in the Thinkster Slack channel so we can help you out.

