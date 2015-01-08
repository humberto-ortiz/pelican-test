#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Humberto Ortiz-Zuazaga'
SITENAME = u'Humberto Ortiz-Zuazaga'
SITEURL = ''

PATH = 'content'

TIMEZONE = 'America/Puerto_Rico'

DEFAULT_LANG = u'en'
LOCALE = "en_US.UTF-8"

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

# Blogroll
LINKS = (('UPR', 'http://www.upr.edu/'),
         ('HPCf', 'http://www.hpcf.upr.edu/'),
         ('UPR-RP', 'http://www.uprrp.edu/'),
         ('CCOM', 'http://ccom.uprrp.edu/'),)

# Social widget
SOCIAL = (#('Facebook', 'https://www.facebook.com/humberto.ortiz.zuazaga'),
#          ('GitHub', 'http://github.com/humberto-ortiz'),
          ('Twitter', 'http://twitter.com/hortizzuazaga'),
          ('LinkedIn', 'http://pr.linkedin.com/in/humbertoortizzuazaga/'),
          #("Google+", "https://plus.google.com/+HumbertoOrtizZuazaga"),)
        )

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

# The site theme
THEME = "../pelican-themes/pelican-bootstrap3"

# Content license http://creativecommons.org/
CC_LICENSE = "CC-BY-SA"

GITHUB_USER = "humberto-ortiz"

# Dark navbar with light letters
BOOTSTRAP_NAVBAR_INVERSE = True

# Plugins, especially for IPython notebooks and mathjax
PLUGIN_PATH = "../pelican-plugins"
PLUGINS = ['liquid_tags.notebook', 'render_math']

# Menus
DISPLAY_PAGES_ON_MENU = False
MENUITEMS = [("Vita", "/vita.html")]

# Notebook paths
##NOTEBOOK_DIR = 'notebooks'
