Title: Like Second Life
Date: 2008-10-23 12:26
Tags: conference, opensim, scripting, secondlife, virtualworlds, web
Slug: second-life

Was without a doubt the phrase I heard most often yesterday, especially
if you include variants like “Not Like Second Life”, “A bit like Second
Life” and “Unlike Second Life”. Whatever else it’s achieved, Second Life
has definitely become the frame of reference for the small and somewhat
myopic crowd that made up the delegates at the sparsely populated
[Virtual Worlds Conference][] in London yesterday.

</p>

[Vastpark][]is not like Second Life because it works in a web browser.
Everyone on the web integration panel seemed to agree that virtual
worlds in a browser is the next step, so I was glad to be there to
question the TechCrunch consensus. How does having a world in a browser
help? What does back and forward mean to a virtual world? What does it
mean for presence to have 10 tabs open looking in to different parts of
the same virtual world? Why would you want your view further constained
by extra web browser widgets? Isn’t 3D in the browser going to be a
blood bath for the next few years? Aren’t you really just using the
browser as a download path? I suggested that the final question was the
real reason that developers are pushing virtual worlds on the web and
that the integration that most people want is to be able to use existing
web and 2D media while using virtual worlds and use web services as a
universal data bus between virtual worlds and other web aware platforms.

</p>

<span class="caps">MPEG</span>-V is not like Second Life because it’s a
standard defined by 35 companies which is much better than the [emerging
Linden led standard][] according to Dr. Yesha Sivan in what was the
worst talk I’ve heard in a long time. Not only did he make the
standardisation process sound like a 3 year political bun-fight by
people who didn’t know much about virtual worlds and who might come up
with a bad standard, he managed to spell <span class="caps">MPEG</span>
and Google incorrectly, called Sun’s Darkstar, Blackstar and attributed
a Ugotrade quote to Philip Rosedale amongst other clangers. He was
roundly rebutted by a large part of the audience including [Tara5 Oh][]
who questioned the need for old fashioned standards processes in the web
era. Thank goodness for rough consensus and running code.

</p>

Most of the virtual worlds talked about in the investment panel were not
like Second Life, but were nearly all [Club Penguin][] clones. This copy
the big exit attitude was called out by one of the audience as it seemed
to be at odds with a lot of the talk about wanting to back the first in
a market, but at least one of the panel is still looking for a
successful 18+ social world play. The panel ended with a show of hands
from people wanting money and people wanting to invest, but the economic
climate made the whole affair very muted with lots of the panelists
saying that they are slowing down rates of investment as it’s difficult
to get existing companies off their books.

</p>

As with [Virtual Policy 08][] and the Virtual Worlds Forum the most
valuable parts of the conference were the spaces between sessions. I had
another very worthwhile discussion with [Adam Frisby][] of
[OpenSim][]about C\# script compatibility between OpenSim and Second
Life. The straw man design we talked about was to have an idiomatic
.<span class="caps">NET</span> interface for event handling that can be
used by C\# scripts and adapted for <span class="caps">LSL</span>
scripts and a set of static library methods for manipulating the world
that would be used directly by <span class="caps">LSL</span> scripts and
wrapped by user created libraries to provide an idiomatic object
oriented interface. Adam was particularly interested in the idea of user
created wrapper libraries as it would allow the creation of an OpenSim
interface library that could be ported to Second Life and implemented in
terms of the ll\* static methods. OpenSim could then agree to support
the common behaviour of this library in Second Life and OpenSim instead
of having to support the gamut of ll\* methods some of which don’t map
well to OpenSim internals. As well as defining a common set of events
and ll\* static methods that are supported on both platforms there would
need to be a way of extending the interface with new events and library
methods. In addition Adam was interested in making the event propogation
configurable so that a single script could respond to events on many
objects in a scene. This would effectively add a script interest
management layer to OpenSim’s scripting interface. Where platforms
provide differing interfaces to scripts we would also need to decide how
scripts query the available interfaces or how they behave when
interfaces are not available.

</p>

Overall a worthwhile trip, but not because of the conference. This
Friday I’ll be talking at the online [head conference][] about
conferencing in Second Life which has the advantage of requiring no
travel making marginal conferences like the Virtual Worlds Conference
less risky to attend while allowing all of the serendipitous networking
opportunities that make real life conferences worthwhile.

</p>

  [Virtual Worlds Conference]: http://www.virtualworlds2007.com/
  [Vastpark]: http://www.vastpark.com/
  [emerging Linden led standard]: http://secondlifegrid.net/technology-programs/virtual-world-open-source/awg
  [Tara5 Oh]: http://www.ugotrade.com/
  [Club Penguin]: http://www.clubpenguin.com/
  [Virtual Policy 08]: http://www.virtualpolicy.net/VP08.html
  [Adam Frisby]: http://www.adamfrisby.com/
  [OpenSim]: http://opensimulator.org/wiki/Main_Page
  [head conference]: http://www.headconference.com
