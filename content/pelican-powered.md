Title: Pelican Powered
Date: 2013-07-02 19:13
Tags: meta, blog, web, python, django, pelican
Slug: pelican-powered

Almost exactly 5 years ago I set up 
[The Creation Engine No. 2](http://jimpurbrick.com/2008/07/01/hello-world/) as a 
[Byteflow](https://bitbucket.org/piranha/byteflow/wiki/Home) blog running on 
[Django](https://www.djangoproject.com/) when the original 
[Creation Engine](http://secondlife.blogs.com/babbage/) blog hosted
by [Linden Lab](http://lindenlab.com) stopped being a suitable place for my 
thoughts on technology as a platform for creativity.

Byteflow and Django served me well until late last year when 
[Recaptcha](http://www.google.com/recaptcha) finally crumbled and I found 
myself spending an increasingly tedious amount of time cleaning up spam comments.

I considered just replacing the comment system with Disqus and Akismet, a 
particularly slick combination which I used on [Creatarr](http://creatarr.com/), 
but without comments Byteflow's full Django openid account system started looking 
pretty archiaic and heavyweight, especially when compared to the 
[Octopress](http://octopress.org/) on [github](https://github.com/) blogs that 
all the cool kids are using.

After some playing around with various [modern static](http://modernstatic.com/) 
frameworks I settled on Pelican, a python framework with some nice, responsive 
[themes](http://pelicanthemes.com/) built with Django based Jinja 2 templates 
which would be easy for me to hack around.

In a couple of hours I had a new 
[git repository](https://github.com/jimpurbrick/thecreationengine.git) 
containing my blog posts [imported](http://docs.getpelican.com/en/3.2/importer.html) 
in to a content directory, a [
fork of the pelican themes](https://github.com/jimpurbrick/pelican-themes.git) 
in a theme directory, my [jimpurbrick.github.com](https://github.com/jimpurbrick/jimpurbrick.github.com) 
repository in an output
directory and all of the pelican dependencies listed in a requirements.txt
ready to be pip installed in to a python virtual environment.

Moving jimpurbrick.com to gh-pages simply required adding a 
[CNAME file](https://help.github.com/articles/setting-up-a-custom-domain-with-pages) 
to the [jimpurbrick.github.com](https://github.com/jimpurbrick/jimpurbrick.github.com) repository 
and pointing DNS to github and it
was possible to emulate Bytemark's clean URLs with Pelican by combining the
post date and slug in it's URL and storing each post in an index.html file so
that requests to the clean URL at github return the index.html file. 

The same hack works to support the existing clean feed URLs which are valid
[Atom](http://validator.w3.org/feed/check.cgi?url=http%3A%2F%2Fjimpurbrick.github.com%2Ffeeds%2Fatom%2Fblog%2F) 
and [RSS](http://validator.w3.org/feed/check.cgi?url=http%3A%2F%2Fjimpurbrick.github.com%2Ffeeds%2Frss%2Fblog%2F) 
feeds, which could be consumed by the late 
[Google Reader](http://reader.google.com) despite the ".html" extension 
causing github to return the feeds with an HTML content type.

    :::python
    ARTICLE_URL = "{date:%Y}/{date:%m}/{date:%d}/{slug}/"
    ARTICLE_SAVE_AS = "{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html"
    FEED_ATOM = "feeds/atom/blog/index.html"
    FEED_RSS = "feeds/rss/blog/index.html"

A few theme tweaks later and I have a lightweight responsive, lightweight
blog that allows me to author posts offline, supports all of the existing 
jimpurbrick.com permalinks and is hopefully ready for the next 5 years of 
The Creation Engine in the mobile first, post Google Reader era.