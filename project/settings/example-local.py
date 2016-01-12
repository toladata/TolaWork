"""Development settings and globals."""

from os.path import join, normpath

from base import *

########## MANAGER CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#admins
ADMINS = (
    ('django', 'django@mercycorps.org'),
)

# See: https://docs.djangoproject.com/en/dev/ref/settings/#managers
MANAGERS = ADMINS
########## END MANAGER CONFIGURATION


########## DEBUG CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#debug
DEBUG = True

# See: https://docs.djangoproject.com/en/dev/ref/settings/#template-debug
TEMPLATE_DEBUG = DEBUG
########## END DEBUG CONFIGURATION


########## EMAIL CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#email-backend
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
########## END EMAIL CONFIGURATION


########## DATABASE CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#databases
DATABASES = {
    'default': {
        #'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '',                      # Or path to database file if using sqlite3.
        # The following settings are not used with sqlite3:
        'USER': '',
        'PASSWORD': '',
        'HOST': 'localhost',                      # Empty for localhost through domain sockets or '127.0.0.1' for localhost through TCP.
        'PORT': '',                      # Set to empty string for default.
    }
}

########## END DATABASE CONFIGURATION

AUTHENTICATION_BACKENDS = (
    'ldaplogin.ldapauth.RemoteUserBackend',
    'django.contrib.auth.backends.ModelBackend',
)


########## CACHE CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#caches
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
    }
}
########## END CACHE CONFIGURATION

# LDAP stuff
LDAP_LOGIN = 'uid=pluma,ou=People,dc=system,dc=mercycorps,dc=org'
LDAP_SERVER = 'ldaps://myurl.org' # ldap dev
#LDAP_SERVER = 'ldaps://myprodurl.org' # ldap prod
LDAP_PASSWORD = 'wickedhardtocrackpassword' # ldap dev
#LDAP_PASSWORD = 'evenmore hardtocrackpassword1' # ldap prod
LDAP_USER_GROUP = 'groupname'
LDAP_ADMIN_GROUP = 'groupadminname'
#ERTB_ADMIN_URL = 'https://myadminurl.org'
