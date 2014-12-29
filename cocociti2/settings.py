"""
Django settings for cocociti2 project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
SETTINGS_DIR=os.path.dirname(__file__)
PROJECT_PATH=os.path.join(SETTINGS_DIR, os.pardir)
PROJECT_PATH=os.path.abspath(PROJECT_PATH)
TEMPLATE_PATH=os.path.join(PROJECT_PATH, 'templates')
STATIC_PATH=os.path.join(PROJECT_PATH, 'static')
DEBUG = True
TEMPLATE_DEBUG = DEBUG
from django.conf.global_settings import TEMPLATE_CONTEXT_PROCESSORS as TCP


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'xb--s^wrkms40hkt5l&lv70@&u$3ortn2pl@^82fj6_*2&8@71'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

SESSION_EXPIRE_AT_BROWSER_CLOSE= True

# Application definition
TEMPLATE_CONTEXT_PROCESSORS = TCP + (
    'django.core.context_processors.request',
)

TEMPLATE_DIRS = (
    TEMPLATE_PATH,
)

# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.gis',
    'landingpage',
    'checkout',
    'listingform',
    'login',
    'productpage',
    'searchfilter',
    'userprofile',
    'geopy',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'cocociti2.urls'

WSGI_APPLICATION = 'cocociti2.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.mysql', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'cocociti3',                      # Or path to database file if using sqlite3.
        'USER': 'root',                      # Not used with sqlite3.
        'PASSWORD': '',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

LOGIN_URL='/login/'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/
STATIC_ROOT =  ''
MEDIA_ROOT = os.path.join(PROJECT_PATH, 'media')
# MEDIA_ROOT = ''
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    STATIC_PATH,
)

STATIC_URL = '/static/'
MEDIA_URL = '/media/'

FILE_UPLOAD_PERMISSIONS = 0644
# LOGIN_URL='/rango/login/'
SESSION_EXPIRE_AT_BROWSER_CLOSE=True