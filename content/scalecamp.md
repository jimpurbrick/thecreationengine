Title: @scalecamp
Date: 2009-12-07 15:49
Tags: scalability, software, technology, web
Slug: scalecamp

</p>

On Friday I jumped on the train to London to attend the first
[scalecampuk][], an unconference about scalability, at the
[Guardian][] offices.

</p>

The sessions were all very interesting and mostly very relevant. I
learned new things about [<span class="caps">XSS</span>][] and
[<span class="caps">CSRF</span>][] and [Django’s defences against
them][] from [Simon Willison][], new things about [messaging][],
[pubsub][], queues and data stores (process 1 message at a time, use
message hospitals, send URLs to unavailable data that can be polled for
with JavaScript and that just check memcache entries) lots about
[Varnish][] ) and it’s use at [Wikia][] from [Artur Bergman][] (Wikia
runs off 18 apaches and 8 varnishes with <span class="caps">60GB</span>
of <span class="caps">RAM</span> and SSDs to serve 25 million pages and
950Mbps at peak, Varnish is generally better than [squid][] ), but you
need a modern kernel).

</p>

Lots of the talks were about moving storage, caching and queuing out of
the application and just writing a small piece of business logic to tie
them together. Against this background [Alex Evans’][] talk about the
back end for Media Molecule’s Little Big Planet stood out like a sore
thumb. Having not enjoyed using a Java web stack, Alex has just
rewritten the whole of the back end as proprietary technology as a
single binary in order to know the code from end to end. While it may be
true that having custom physics or rendering middleware might
distinguish Little Big Planet from other games, I can’t believe that
custom technology to serve <span class="caps">HTTP</span> requests is
going to be a competitive advantage. I hope Alex’s good ideas become
[Redis][] contributions rather than a maintenance nightmare and barrier
to agility.

</p>

The lightning talks were also very good. Simon’s “ScaleFail” talk about
the [Guardian <span class="caps">MP</span> expenses app][] was hilarious
(lesson: do load testing) and Gareth’s talk about [Dumbo][] (a Python
Hadoop client) was very useful.

</p>

At times it felt like the talks were suited to an ops audience, but
“Dev’s should know about this!” was a regular refrain. Don’t worry: I
listened and learned a lot. Thanks to everyone who made it a great day.

</p>

  [scalecampuk]: http://www.scalecamp.org.uk/
  [Guardian]: http://guardian.co.uk
  [<span class="caps">XSS</span>]: http://en.wikipedia.org/wiki/Cross-site_scripting
  [<span class="caps">CSRF</span>]: http://en.wikipedia.org/wiki/CSRF
  [Django’s defences against them]: http://simonwillison.net/2009/Sep/28/ponies/
  [Simon Willison]: http://simonwillison.net
  [messaging]: http://en.wikipedia.org/wiki/Message_Oriented_Middleware
  [pubsub]: http://en.wikipedia.org/wiki/Publish/subscribe
  [Varnish]: http://en.wikipedia.org/wiki/Varnish_(software
  [Wikia]: http://www.wikia.com/wiki/Wikia
  [Artur Bergman]: http://radar.oreilly.com/artur/
  [squid]: http://en.wikipedia.org/wiki/Squid_(software
  [Alex Evans’]: http://bluespoon.tumblr.com/
  [Redis]: http://code.google.com/p/redis/
  [Guardian <span class="caps">MP</span> expenses app]: http://mps-expenses.guardian.co.uk/
  [Dumbo]: http://wiki.github.com/klbostee/dumbo
