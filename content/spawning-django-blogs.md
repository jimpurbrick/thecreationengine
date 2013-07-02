Title: Spawning Django Blogs
Date: 2010-10-18 16:25
Tags: blogging, django, meta, python, software
Slug: spawning-django-blogs

Since leaving [Linden Lab][] I have been talking to a number of people
about doing freelance consulting and development work while I get my
start-up off the ground and last week got round to setting up a
<span class="caps">UK</span> limited company so that people will
actually be able to pay me.

</p>

Setting up a company is insanely easy these days: if you go to
[companies made simple][] it will cost you less than £17 and 10 minutes
of form filling. Coming up with a name is harder, but within a couple of
hours I found that 18dex was available as a .com
<span class="caps">TLD</span>, twitter account and facebook username.
Meaningful 5 character .coms are pretty tricky to come by these days, so
I snapped it up and 18 Dexterity Ltd. was born — a pretty fantastically
geeky name for an agile software engineering company I hope
you’ll agree.

</p>

A few minutes later I had a holding page up for 18dex.com, but it looked
pretty sad with no content, so I started thinking about setting it up as
a blog. I have a stack of relevant software engineering posts on
jimpurbrick.com from the last few years, but they are sandwiched between
less relevant posts on [100robots][], [Second Life][] and various
miscellany. I didn’t want to move the software engineering posts from
[jimpurbrick.com][] as they’re part of what I do and regularly updating
a single blog is quite enough work. I also didn’t want to copy the posts
from one blog to another as it would potentially end up with 2
independent comment threads on each blog. There would be no definitive
version of a post, a blatant violation of [Don’t Repeat Yourself][].

</p>

Luckily Django includes a piece of machinery to deal with this problem
in its [sites framework][], something I’ve been meaning to have a closer
look at for some time. The sites machinery simply lets you associate a
piece of content with a site and keeps track of the current site,
allowing you to filter the content in the database to only show a subset
on each site.

</p>

While the [byteflow][] blog engine I use for jimpurbrick.com supports
the sites framework, each post is associated with a single site via a
ForeignKey. In order to allow posts to be shown on both jimpurbrick.com
and 18dex.com I had to change that ForeignKey field to be a
ManyToManyField: a single line change in the python code, but something
that requires a little wrangling to massage the existing data to fit the
new model.

</p>

I’ve been using the excellent [South][] in all my recent projects to
allow me to easily migrate data across django model changes. Although
jimpurbrick.com dates from long before South was available I managed to
convince south to manage the migration by dumping the blog\_post table
to json, dropping the table and recreating it with south, reloading the
data and then letting south migrate the data to the new ManyToMany
schema. While this was slightly more fiddly than it could have been it
means that the blog app is now being managed by south, which will make
future development on the blogs much easier.

</p>

Once I had migrated the data to the new model and associated the
software engineering posts in jimpurbrick.com with both sites in the
django admin interface all that remained was for me to clone the
jimpurbrick.com directory with mercurial to create an 18dex.com
directory and choose and tweak a byteflow theme for the new site.

</p>

Once again I’ve been very impressed with Django and Byteflow, which have
proven to be incredibly powerful tools that are very easy to work with.
In a few hours I was able to create professional and personal views on
to my blogging which can be easily administered from a single interface
and allow comment threads and users to easily flow between them. If
you’re just interested in my software engineering posts, head over to
[18dex.com][], if you want to hear about music, Second Life and
everything else I get up to, stay subscribed to [jimpurbrick.com][]. If
you notice anything broken on either blog, then please leave a comment
to let me know.

</p>

  [Linden Lab]: http://lindenlab.com/
  [companies made simple]: http://www.companiesmadesimple.com/
  [100robots]: http://100robots.com
  [Second Life]: http://secondlife.com
  [jimpurbrick.com]: http://jimpurbrick.com
  [Don’t Repeat Yourself]: http://www.c2.com/cgi/wiki?DontRepeatYourself
  [sites framework]: http://docs.djangoproject.com/en/dev/ref/contrib/sites/
  [byteflow]: http://byteflow.su/
  [South]: http://south.aeracode.org/
  [18dex.com]: http://18dex.com
