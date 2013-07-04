#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Jim Purbrick'
SITENAME = u'The Creation Engine No. 2'
SITEURL = 'http://jimpurbrick.com'

ARTICLE_URL = "{date:%Y}/{date:%m}/{date:%d}/{slug}/"
ARTICLE_SAVE_AS = "{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html"

TIMEZONE = 'Europe/London'

DEFAULT_LANG = u'en'

DEFAULT_PAGINATION = 10

TYPOGRIFY = True
TAG_CLOUD_STEPS = 4
TAG_CLOUD_MAX_ITEMS = 100

GITHUB_URL = 'http://github.com/jimpurbrick'
TWITTER_USERNAME = 'JimPurbrick'

LINKS = (('Brian Green', 'http://psychochild.org/'),
         ('Damion Schubert', 'http://www.zenofdesign.com/'),
         ('Raph Koster', 'http://www.raphkoster.com/'),
         ('Gwyneth Llewelyn', 'http://gwynethllewelyn.net/'),
         ('James Au', 'http://nwn.blogs.com/'),
         ('Adam Martin', 'http://t-machine.org/'),
         ('Aleks Krotoski', 'http://alekskrotoski.com/'),
         ('Alice Taylor', 'http://www.wonderlandblog.com/'),
         ('Ian Hughes', 'http://epredator.com/'),
         ('Andy Piper', 'http://andypiper.co.uk/'),
         ('Dave Hillier', 'http://davehillier.wordpress.com/'),
         ('Cory Ondrejka', 'http://ondrejka.net/'),
         ("Bryan O'Sullivan", 'http://www.serpentine.com/'),
         ('Simon Stewart', 'http://blog.rocketpoweredjetpants.com/'),)

SOCIAL = (('facebook', 'http://facebook.com/jimpurbrick'),
          ('twitter', 'http://twitter.com/jimpurbrick'),
          ('linkedin', 'http://uk.linkedin.com/in/jimpurbrick'),
          ('delicious', 'http://delicious.com/JimPurbrick'),
          ('github', 'http://github.com/jimpurbrick'),
          ('bitbucket', 'http://bitbucket.org/jimpurbrick'),
          ('stackoverflow', 'http://stackoverflow.com/users/932594/jim-purbrick'),
          ('lastfm', 'http://last.fm/user/jimpurbrick'),
          ('flickr', 'http://flickr.com/jimpurbrick'),)

STATIC_PATHS = ['images']

THEME = 'themes/tuxlite_tbs'
DISPLAY_CATEGORIES_ON_MENU = False
