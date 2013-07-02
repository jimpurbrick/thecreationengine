Title: 100 robots Vs The Audience
Date: 2012-01-04 16:44
Tags: 100robots, ableton, iphone, music, osc
Slug: 100-robots-vs-audience

A couple of years ago I had great fun putting together the [London Geek
Community iPhone OSCestra][] at [Open Hack London][] and I’ve been
controlling Ableton Live with iPhone tapped to my guitar as part of [100
robots][] for [a couple of years now][] so when [@andybudd][] suggested
I do a digital music thing for the [Brighton Digital Festival][] I
immediately thought that it would be fun to combine the 2 projects by
doing a 100 robots performance with audience participation.

The iPhone OSCestra was effectively a distributed collaborative mixing
desk with each person controlling the volume and effect parameters on
one channel of a playing back Ableton Live set. For the 100 robots
performance I wanted to go further and have the audience actually adding
parts to the musical performance, so [@toastkid][] and I added extra
drum, bass, synth and sample tracks to the 100 robots live set and
filled them full of samples that could be triggered by the audience.

While having the samples adjust in tempo to match each song was
relatively simple, transposing them to match the key of each song was
more complicated. First I built a [custom slice to midi preset][] which
mapped the sample transpose to a macro control and used it to slice all
of the samples to <span class="caps">MIDI</span> tracks, then mapped all
of the transpose controls to a single <span class="caps">MIDI</span>
controller and added a <span class="caps">MIDI</span> track which output
the appropriate controller value for each song to a
<span class="caps">MIDI</span> output which was looped back in to Live
to transpose the samples.

The next question was how to avoid the performance turning in to a mush
if multiple drum tracks or bass parts were playing concurrently. To
avoid this we put [dummy clips][] on the normal 100 robots which muted
the normal parts when the audience triggered parts were playing. In some
cases we let the audience parts add to the music, in others the audience
parts would play instead of the normal tracks.

A final question was how to avoid max and I getting lost when the normal
parts we play along to were replaced by unfamiliar samples. To deal with
this we set the clip quantization on the audience triggered clips to
values longer than the clip length. This meant that even if alternate
baselines were constantly being launched, we would still hear the normal
bassline for a while at the end of each quantization period, so we would
know where we were with the track. To tune these settings we did some
[fuzz testing][] with semi random <span class="caps">MIDI</span> data to
see how much madness we could deal with and still manage to play
the songs.

With the tests done it was time to perform with 100 robots and 100s of
people at the Brighton Dome and Museum.

<iframe width="560" height="315" src="http://www.youtube.com/embed/cdl-J6DA9Ac?hd=1" frameborder="0" allowfullscreen></iframe>

With the tests done it was time to perform with 100 robots and 100s of people at the Brighton Dome and Museum.

<iframe width="560" height="315" src="http://www.youtube.com/embed/GhusIQtw9IA" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="http://www.youtube.com/embed/videoseries?list=PLF7C555F2D572B3E4&amp;hl=en_GB&amp;hd=1" frameborder="0" allowfullscreen></iframe>

Many thanks to Steve Liddell for recording the Brighton Museum set,
[@aral][] for letting us experiment on his [update conference][] and to
everyone who participated and watched. If you’d like to host another
performance, please get in touch and if you like the music, please check
out the [100 robots blog][100 robots] and consider buying our album from
[bandcamp][].

  [London Geek Community iPhone OSCestra]: http://jimpurbrick.com/2009/05/12/london-geek-community-iphone-oscestra/
  [Open Hack London]: http://openhacklondon.pbworks.com/FrontPage
  [100 robots]: http://100robots.com
  [a couple of years now]: http://vimeo.com/7967321
  [@andybudd]: https://twitter.com/#!/andybudd
  [Brighton Digital Festival]: http://brightondigitalfestival.co.uk/
  [@toastkid]: http://jimpurbrick.com/feeds/atom/blog/
  [custom slice to midi preset]: http://forum.ableton.com/viewtopic.php?f=4&t=90512
  [dummy clips]: http://www.ableton.com/blog/2012/01/02/dummy-clips-quantize-courses/
  [fuzz testing]: http://en.wikipedia.org/wiki/Fuzz_testing
  [@aral]: https://twitter.com/#!/aral
  [update conference]: http://updateconf.com/
  [bandcamp]: http://100robots.bandcamp.com
