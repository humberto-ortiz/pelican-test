AUTHOR = 'Humberto Ortiz-Zuazaga'
SITENAME = 'Humberto Ortiz-Zuazaga'
SITEURL = ""

PATH = "content"

TIMEZONE = 'America/Puerto_Rico'

DEFAULT_LANG = 'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = (('Google Scholar', 'https://scholar.google.com/citations?user=jlRDnO8AAAAJ&hl=en&oi=ao'),
         ("ORCID Profile", "//orcid.org/0000-0002-4667-8357"))

#LINKS = (
#    ("Pelican", "https://getpelican.com/"),
#    ("Python.org", "https://www.python.org/"),
#    ("Jinja2", "https://palletsprojects.com/p/jinja/"),
#    ("You can modify those links in your config file", "#"),
#)

# Social widget
SOCIAL = (#('Facebook', 'https://www.facebook.com/humberto.ortiz.zuazaga'),
#          ('GitHub', 'http://github.com/humberto-ortiz'),
#          ('Twitter', 'http://twitter.com/hortizzuazaga'),
          ('LinkedIn', 'http://pr.linkedin.com/in/humbertoortizzuazaga/'),
          #("Google+", "https://plus.google.com/+HumbertoOrtizZuazaga"),)
        )

DEFAULT_PAGINATION = False

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

# The site theme
THEME = "../pelican-themes/pelican-bootstrap3"

# Content license http://creativecommons.org/
CC_LICENSE = "CC-BY-SA"

GITHUB_USER = "humberto-ortiz"

# Dark navbar with light letters
BOOTSTRAP_NAVBAR_INVERSE = True

# Plugins, especially for IPython notebooks and mathjax
PLUGIN_PATHS = ["../pelican-plugins"]

## beautiful soup, required by pelican-bootstrapify, kills (some)
## {filename} links
##PLUGINS = ['liquid_tags.notebook', 'render_math', "pelican-bootstrapify"]

## bootswatch-markdown applies table class to tables (much nicer)
PLUGINS = ['pelican.plugins.liquid_tags', 'pelican.plugins.render_math', "bootswatch_markdown_css", "i18n_subsites"]

LIQUID_TAGS = ['notebook']


JINJA_ENVIRONMENT = {
    'extensions': ['jinja2.ext.i18n'],
}

# Menus
DISPLAY_PAGES_ON_MENU = False
MENUITEMS = [("Vita", "/~humberto/vita.html"),
             ("Megaprobe Lab", "/~humberto/megaprobe/")]

# Notebook paths
##NOTEBOOK_DIR = 'notebooks'

STATIC_PATHS = ["images", "scripts"]

