#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Jim Purbrick'
SITENAME = u'The Creation Engine No. 2'
SITEURL = '' # 'http://jimpurbrick.com'

ARTICLE_URL = "{date:%Y}/{date:%m}/{date:%d}/{slug}/"
ARTICLE_SAVE_AS = "{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html"

TIMEZONE = 'Europe/London'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = "feeds/atom/blog"
FEED_ALL_RSS = "feeds/rss/blog"
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

DEFAULT_PAGINATION = 10

TYPOGRIFY = True
TAG_CLOUD_STEPS = 4
TAG_CLOUD_MAX_ITEMS = 100

GITHUB_URL = 'http://github.com/jimpurbrick'
DISQUS_SITENAME = 'thecreationengine'
TWITTER_USERNAME = 'JimPurbrick'
GOOGLE_ANALYTICS = 'UA-4868739-1'

LINKS = (('Brian Green', 'http://psychochild.org/'),
         ('Gwyneth Llewelyn', 'http://gwynethllewelyn.net/'),
         ('James Au', 'http://nwn.blogs.com/'),
         ('Adam Martin', 'http://t-machine.org/'),
         ('Aleks Krotoski', 'http://alekskrotoski.com/'),
         ('Ian Hughes', 'http://epredator.com/'),
         ('Andy Piper', 'http://andypiper.co.uk/'),
         ('Dave Hillier', 'http://davehillier.wordpress.com/'),
         ('Cory Ondrejka', 'http://ondrejka.net/'),)

SOCIAL = (('facebook', 'http://facebook.com/jimpurbrick'),
          ('twitter', 'http://twitter.com/jimpurbrick'),
          ('github', 'http://github.com/jimpurbrick'),
          ('lastfm', 'http://lastfm.com/user/jimpurbrick'),
          ('flickr', 'http://flickr.com/jimpurbrick'),)

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True

THEME = 'themes/tuxlite_tbs'
