Title: The JavaScript Jungle
Date: 2011-10-03 02:47
Tags: art, brighton, collaboration, creation, digital, festival, javascript, life, second
Slug: javascript-jungle

There was a slide in the early talks that [Cory Ondrejka](http://ondrejka.net/) used to give about Second Life about alien abductions in [Second Life](http://secondlife.com). One of the most exciting moments in Second Life for the early Lindens was when a resident constructed a UFO and flew around the world abducting other residents and then returning them to the world with a commemorative t-shirt. It was exciting because it was unanticipated. The Lindens had created a virtual world that enabled interaction and someone had taken it and run with it to create a fun and engaging experience.

So, once I'd finished implementing a simple [interest management](http://dl.acm.org/citation.cfm?id=351027&dl=ACM&coll=DL&CFID=53271178&CFTOKEN=59247649) and collision detection system for the [Brighton Digital Festival](http://brightondigitalfestival.co.uk/) [JavaScript Jungle](http://asyncjs.com/the-mighty-jungle/) to enable interactions, I thought I would implement an alien abductor as a hat tip to Second Life.

The [JavaScript](https://gist.github.com/1206090) first adds a UFO from [You're The Boss 2](http://jimpurbrick.com/2011/09/12/youre-boss-2/) to the supplied div along with an [SVG](http://en.wikipedia.org/wiki/Scalable_Vector_Graphics) canvas containing a hidden translucent tractor beam path before binding to the see and tick events. The tick handler implements a state machine which either moves the UFO towards a random spot, a target creature that the UFO has seen or drags the target off screen for diabolical experimentation.

The most interesting part of the code on line 155 which replaces the target's position method with one which returns the target's position, but doesn't update. This allows the UFO to move the target while the position updates made by the target's own code call the new read only position method. [Tom Parslow](http://almostobsolete.net)'s boids look especially mournful flapping around and turning towards the flock while being captured.

<p><a href="http://jungle.asyncjs.com/"><img src="http://farm7.static.flickr.com/6173/6192029711_a8ff1bf0e6_o.jpg"></a></img></p>

While the alien abductions in Second Life and the JavaScript jungle are meant to be fun and mostly harmless, the same mechanisms that enable them can be used for griefing in virtual environments and malware in software at large. The ability for scripted objects in Second Life to self replicate caused dozens of problems with [grey goo](http://en.wikipedia.org/wiki/Grey_goo) attacks for every amazing [virtual ecosystem](http://nwn.blogs.com/nwn/2005/06/evolving_nemo.html) and many malicious cage attacks for every playful alien abductor.

The [message passing concurrency](http://c2.com/cgi/wiki?MessagePassingConcurrency) model adopted by LSL actually made direct attacks on other scripts of the kind used by the JavaScript Jungle UFO very hard, but things are much harder in JavaScript's browser environment even when separating scripts in iFrames.

Luckily projects like [Caja](http://code.google.com/p/google-caja/) and [Belay](https://sites.google.com/site/belayresearchproject/) (which is being worked on by another ex-Linden, [Mark Lentczner](http://www.ozonehouse.com/mark/) ) are working on the problem of making multiple scripts work safely in the same browser.

The challenge for sandboxes like Second Life and the JavaScript jungle is to allow interesting and meaningful interactions with emergent properties and unanticipated consequences without allowing malicious scripts to destroy that environment. Building the [JavaScript Jungle](http://asyncjs.com/the-mighty-jungle/) was a lot of fun and made for another great [Brighton Digital Festival](http://brightondigitalfestival.co.uk/) project. Many congratulations to [@premasagar](http://twitter.com/#!/premasagar), [@ac94](http://twitter.com/#!/ac94), [@purge](http://twitter.com/#!/purge) and everyone else for making it a success. Maybe next time we can try to build a secure JavaScript Jungle that is both secure and expressive.
