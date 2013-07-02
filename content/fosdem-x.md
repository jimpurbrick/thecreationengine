Title: FOSDEM X
Date: 2010-02-10 13:52
Tags: c#, free, libre, lsl, mono, open, opensource, scripting, secondlife, software
Slug: fosdem-x

<object width="400" height="300"> <param name="flashvars" value="offsite=true&lang=en-us&page_show_url=%2Fsearch%2Fshow%2F%3Fq%3Dfosdem%26d%3Dtaken-20100204-20100208%26ss%3D0%26ct%3D0%26mt%3Dall%26adv%3D1&page_show_back_url=%2Fsearch%2F%3Fq%3Dfosdem%26d%3Dtaken-20100204-20100208%26ss%3D0%26ct%3D0%26mt%3Dall%26adv%3D1&method=flickr.photos.search&api_params_str=&api_text=fosdem&api_tag_mode=bool&api_min_taken_date=2010-02-04+00%3A00%3A00&api_max_taken_date=2010-02-09+00%3A00%3A00&api_media=all&api_sort=relevance&jump_to=&start_index=0"></param> <param name="movie" value="http://www.flickr.com/apps/slideshow/show.swf?v=71649"></param> <param name="allowFullScreen" value="true"></param><embed type="application/x-shockwave-flash" src="http://www.flickr.com/apps/slideshow/show.swf?v=71649" allowFullScreen="true" flashvars="offsite=true&lang=en-us&page_show_url=%2Fsearch%2Fshow%2F%3Fq%3Dfosdem%26d%3Dtaken-20100204-20100208%26ss%3D0%26ct%3D0%26mt%3Dall%26adv%3D1&page_show_back_url=%2Fsearch%2F%3Fq%3Dfosdem%26d%3Dtaken-20100204-20100208%26ss%3D0%26ct%3D0%26mt%3Dall%26adv%3D1&method=flickr.photos.search&api_params_str=&api_text=fosdem&api_tag_mode=bool&api_min_taken_date=2010-02-04+00%3A00%3A00&api_max_taken_date=2010-02-09+00%3A00%3A00&api_media=all&api_sort=relevance&jump_to=&start_index=0" width="400" height="300"></embed></object>

</p>

Last weekend I went to the 10th Free and Open Source Developers European
Meeting in Brussels. This year was the first time that
[<span class="caps">FOSDEM</span>][] had hosted a track on [Mono][], so
I went along to find out what’s going on with Mono, tell the Mono folk
what our plans are for C\# and fill in some gaps.

</p>

I started Saturday on the monitoring track which included a terrible
talk about an interesting tool that I hadn’t heard of: [SystemTap][] — a
scriptable system monitoring tool designed to allow diagnosis of
problems at run time on production servers without the usual instrument,
compile, analyse loop. stap looks really interesting and useful as a
tool for augmenting or replacing our current simulator
performance tools.

</p>

After the stap talk I headed over to the
[<span class="caps">XMPP</span>][] track for the rest of the day and saw
some great talks on [<span class="caps">BOSH</span>][], [onsocialweb][],
[pubsub][], [strophe.js][], [collecta][] and [node.js][]. Federated,
open social networks seem to be a big thing at the moment (@blaine was
talking about them at [@scalecampuk][] ) and there was lots of interest
in using <span class="caps">XMPP</span> to build them as it already has
standards for identity, presence, friends and events. Given that jabber
and <span class="caps">XMPP</span> is a decade old it makes you wonder
why the standards weren’t used the first time round. A possible reason
is that <span class="caps">XMPP</span> doesn’t have it’s rails/django
yet and still looks pretty clunky to work with although Strophe.js may
help. Another reason may be that <span class="caps">XMPP</span> hasn’t
been the web up until now, although <span class="caps">BOSH</span> may
be the bridge that’s needed there.

</p>

While everyone else was thinking about using
<span class="caps">XMPP</span> to build Twitter and Facebook I started
thinking about what an open, federated virtual world platform built on
<span class="caps">XMPP</span> might look like. I wasn’t the only one.
The [realXtend][] folks turned up to show off their latest new from the
ground up viewer which uses <span class="caps">XMPP</span> and jingle
for voice and <span class="caps">IM</span> integration and were
obviously thinking along the same lines. As realXtend seem to be moving
away from <span class="caps">SL</span> tech now, expect an
<span class="caps">XMPP</span> based back end from them soon…

</p>

I spent Sunday camped out in the Mono room which was interesting from a
cultural point of view. Miguel de Icaza seems to have completed his
transition from champion to enemy of freedom in the open source
community’s eyes. Last time he was at <span class="caps">FOSDEM</span>
he was accused of talking about “Coca Cola” when showing off the closed
source [Unity][] engine that uses Mono, so stayed strictly to open
technologies in his talk this year. Luckily, due to [Microsoft’s
Community Promise][] and open sourcing of the
[<span class="caps">DLR</span>][], [IronPython][] and [IronRuby][], that
includes a lot of the .<span class="caps">NET</span> platform and gave
him lots to talk about. Most of the legitimate worries of patents around
Mono have been resolved, but talking about [C\#][] and the
[<span class="caps">CLI</span>][] at <span class="caps">FOSDEM</span>
still requires a poster asking people to leave their religion at the
door, apparently.

</p>

In my Second Life talk, I gave a summary of the interesting things we
did to get <span class="caps">LSL</span> on Mono working in 2008 and
then outlined our plans for C\# in the future including lots of question
marks around how we’re currently planning to implement them. Lots of my
questions were answered after the talk and it turns out that the Unity
developers are wrestling with the same problems at the moment, so we
should be able to work together over the next few months to make a lot
of progress.

</p>

Overall <span class="caps">FOSDEM</span> was hugely informative and
enjoyable and I have a big shopping list of exciting new technologies to
play with over the next few months. Hopefully the Mono room will become
a regular fixture and we’ll be able to head back next year.

</p>

  [<span class="caps">FOSDEM</span>]: http://fosdem.org/2010/
  [Mono]: http://www.mono-project.com/Main_Page
  [SystemTap]: http://sourceware.org/systemtap/
  [<span class="caps">XMPP</span>]: http://xmpp.org/
  [<span class="caps">BOSH</span>]: http://xmpp.org/extensions/xep-0206.html
  [onsocialweb]: http://onesocialweb.org/
  [pubsub]: http://xmpp.org/extensions/xep-0060.html
  [strophe.js]: http://code.stanziq.com/strophe/
  [collecta]: http://collecta.com/
  [node.js]: http://nodejs.org/
  [@scalecampuk]: http://jimpurbrick.com/2009/12/07/scalecamp/
  [realXtend]: http://www.realxtend.org/
  [Unity]: http://unity3d.com/
  [Microsoft’s Community Promise]: http://www.microsoft.com/interop/cp/default.mspx
  [<span class="caps">DLR</span>]: http://en.wikipedia.org/wiki/Dynamic_Language_Runtime
  [IronPython]: http://ironpython.net/
  [IronRuby]: http://ironruby.net/
  [C\#]: http://www.ecma-international.org/publications/standards/Ecma-334.htm
  [<span class="caps">CLI</span>]: http://www.ecma-international.org/publications/standards/Ecma-335.htm
