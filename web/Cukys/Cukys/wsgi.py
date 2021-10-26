"""
WSGI config for Cukys project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/howto/deployment/wsgi/
"""

import os, sys

from django.core.wsgi import get_wsgi_application

sys.path.append('/mnt/c/Users/zevallos.julio/Analyse_Erronka1/web/Cukys')
sys.path.append('/mnt/c/Users/zevallos.julio/Analyse_Erronka1/web/sebastian-venv/lib/python3.8/site-packages')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Cukys.settings')

application = get_wsgi_application()
