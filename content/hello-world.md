Title: Hello World
Date: 2008-07-01 09:21
Tags: blog, byteflow, django, meta, web
Slug: hello-world

Well, not exactly. Having blogged previously on [Terra Nova][], the
original [Creation Engine][] and currently on the [Official Second Life
Blog][], I’m not exactly stumbling blinking in to the blinding light of
the blogosphere. Recently a number of things have come up that I’ve
wanted to write more than [140 words about][], but that wouldn’t fit on
the Official Second Life Blog [any][] [more][], so I’ve finally stopped
mooching off other people and set up my own blog.

</p>

One reason I hadn’t got around to it sooner is that I’ve been torn
between platforms. Although it’s been tempting to throw up a
[WordPress][] blog every time I’ve had something to talk about, I really
wanted to build a blog in [Django][] that I could tinker and experiment
with. Although it’s just a matter of [plugging bits together][], it
still takes a few hours to get a basic Django blog up and running and
longer to add all the bells and whistles. I finally managed to break the
impasse last week when I came across this [list of Django blog
engines][] and after some routing around decided to go with [byteflow][]
which has all the bells and whistles but is made of standard Django bits
and is eminently tinkerable.

</p>

So, that’s what you see here: a default byteflow blog running on [Django
trunk][] running in [mod\_python][] as a virtual host (alongside the
[slateit.org][] and [carbongoggles.org][] Django apps) inside
[apache2][] running on [ubuntu][] dapper on a virtual machine hosted by
[bytemark][]. It took long enough to get round to, but once I’d found
byteflow it only took an hour to set up. I’ll be kicking the wheels and
tinkering over the coming weeks, but if you find anything broken, please
let me know.

</p>

  [Terra Nova]: http://terranova.blogs.com "Terra Nova"
  [Creation Engine]: http://secondlife.blogs.com/babbage/
    "The Creation Engine"
  [Official Second Life Blog]: http://blog.secondlife.com/author/babbagelinden
    "Official Second Life Blog"
  [140 words about]: http://twitter.com/JimPurbrick
    "Twitter / JimPurbrick"
  [any]: http://blog.secondlife.com/2006/08/15/last-sound-system/
    "Last Sound System"
  [more]: http://blog.secondlife.com/2007/06/18/slorpedo/ "SLorpedo"
  [WordPress]: http://wordpress.org/ "WordPress"
  [Django]: http://www.djangoproject.com/ "Django"
  [plugging bits together]: http://www.b-list.org/weblog/2007/nov/29/django-blog/
    "Where is Django’s blog application?"
  [list of Django blog engines]: http://paltman.com/2008/02/02/i-want-to-move-my-blog-to-django/
    "Django Blog Engines"
  [byteflow]: http://byteflow.su/ "Byteflow"
  [Django trunk]: http://code.djangoproject.com/svn/django/trunk/
    "Django Trunk"
  [mod\_python]: http://jimpurbrick.com/feeds/atom/blog/www.modpython.org
    "mod_python"
  [slateit.org]: http://slateit.org "SLateIt"
  [carbongoggles.org]: http://carbongoggles.org "Carbon Goggles"
  [apache2]: http://httpd.apache.org/ "Apache HTTPD"
  [ubuntu]: http://www.ubuntu.com/ "Ubuntu"
  [bytemark]: http://www.bytemark.co.uk "Bytemark hosting"
