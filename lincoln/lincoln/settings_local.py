"""
Django settings for lincoln project.
"""

import os

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# If running in docker, ensure that these settings match those in your docker compose file.
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