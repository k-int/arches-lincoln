"""
Django settings for lincoln project.
"""

import os
import arches
import inspect
import ast
import requests
import sys
from settings import *

try:
    from arches.settings import *
except ImportError:
    pass

APP_ROOT = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
STATICFILES_DIRS =  (os.path.join(APP_ROOT, 'media'),) + STATICFILES_DIRS

DATATYPE_LOCATIONS.append('lincoln.datatypes')
FUNCTION_LOCATIONS.append('lincoln.functions')
TEMPLATES[0]['DIRS'].append(os.path.join(APP_ROOT, 'functions', 'templates'))
TEMPLATES[0]['DIRS'].append(os.path.join(APP_ROOT, 'widgets', 'templates'))
TEMPLATES[0]['DIRS'].insert(0, os.path.join(APP_ROOT, 'templates'))

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '$r%6my(^ted29ym+jbol%-avc-hb-bkyys@_+sry&-emi!$_-l'
USER_SECRET_KEY = get_optional_env_variable('DJANGO_SECRET_KEY')
if USER_SECRET_KEY:
    # Make this unique, and don't share it with anybody.
    SECRET_KEY = USER_SECRET_KEY

# SECURITY WARNING: don't run with debug turned on in production!
MODE = get_env_variable('DJANGO_MODE') #options are either "PROD" or "DEV" (installing with Dev mode set, get's you extra dependencies)
DEBUG = ast.literal_eval(get_env_variable('DJANGO_DEBUG'))

COUCHDB_URL = 'http://{}:{}@{}:{}'.format(get_env_variable('COUCHDB_USER'), get_env_variable('COUCHDB_PASS'),get_env_variable('COUCHDB_HOST'), get_env_variable('COUCHDB_PORT')) # defaults to localhost:5984


ROOT_URLCONF = 'lincoln.urls'

# a prefix to append to all elasticsearch indexes, note: must be lower case
ELASTICSEARCH_PREFIX = 'lincoln'

USER_ELASTICSEARCH_PREFIX = get_optional_env_variable('ELASTICSEARCH_PREFIX')
if USER_ELASTICSEARCH_PREFIX:
    ELASTICSEARCH_PREFIX = USER_ELASTICSEARCH_PREFIX

DATABASES = {
    "default": {
        "ATOMIC_REQUESTS": False,
        "AUTOCOMMIT": True,
        "CONN_MAX_AGE": 0,
        "ENGINE": "django.contrib.gis.db.backends.postgis",
        "HOST": "db",
        "NAME": "arches",
        "OPTIONS": {},
        "USER": "postgres",
        "PASSWORD": "postgres",
        "PORT": "5432",
        "POSTGIS_TEMPLATE": "template_postgis_20",
        "TEST": {
            "CHARSET": None,
            "COLLATION": None,
            "MIRROR": None,
            "NAME": None
        },
        "TIME_ZONE": None
    }
}


ALLOWED_HOSTS = get_env_variable('DOMAIN_NAMES').split()

SYSTEM_SETTINGS_LOCAL_PATH = os.path.join(APP_ROOT, 'system_settings', 'System_Settings.json')
WSGI_APPLICATION = 'lincoln.wsgi.application'
STATIC_ROOT = '/static_root'

RESOURCE_IMPORT_LOG = os.path.join(APP_ROOT, 'logs', 'resource_import.log')

LOGGING = {   'disable_existing_loggers': False,
    'handlers': {   'file': {   'class': 'logging.FileHandler',
                                'filename': os.path.join(APP_ROOT, 'arches.log'),
                                'level': 'DEBUG'}},
    'loggers': {   'arches': {   'handlers': [   'file'],
                                 'level': 'DEBUG',
                                 'propagate': True}},
    'version': 1}

# Absolute filesystem path to the directory that will hold user-uploaded files.

MEDIA_ROOT =  os.path.join(APP_ROOT)

TILE_CACHE_CONFIG = {
    "name": "Disk",
    "path": os.path.join(APP_ROOT, 'tileserver', 'cache')

    # to reconfigure to use S3 (recommended for production), use the following
    # template:

    # "name": "S3",
    # "bucket": "<bucket name>",
    # "access": "<access key>",
    # "secret": "<secret key>"
}

APP_NAME = 'Arcade'
APP_TITLE = 'Arcade'

PREFERRED_COORDINATE_SYSTEMS = (
    {"name": "Geographic", "srid": "4326", "proj4": "+proj=longlat +datum=WGS84 +no_defs", "default": True}, #Required
)
# DATE_IMPORT_EXPORT_FORMAT = '%Y-%m-%d'

DATE_IMPORT_EXPORT_FORMAT = '%d/%m/%Y'
ANALYSIS_COORDINATE_SYSTEM_SRID = 27700

try:
    from settings_local import *
except ImportError:
    pass
