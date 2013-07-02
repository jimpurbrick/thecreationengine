#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# This file is only used if you use `make publish` or
# explicitly specify it as your config file.

import os
import sys
sys.path.append(os.curdir)
from pelicanconf import *

SITEURL = 'http://jimpurbrick.github.com'
RELATIVE_URLS = False

# Feed generation is usually not desired when developing
FEED_ATOM = "feeds/atom/blog/index.html"
FEED_RSS = "feeds/rss/blog/index.html"
FEED_ALL_ATOM = None
FEED_ALL_RSS = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

DELETE_OUTPUT_DIRECTORY = False

# Following items are often useful when publishing
DISQUS_SITENAME = 'thecreationengine'
GOOGLE_ANALYTICS = 'UA-4868739-1'
