Title: Disco Snake
Date: 2010-09-15 17:25
Tags: audio, html5, music, music hack day
Slug: disco-snake

<object style="height: 390px; width: 640px"><param name="movie" value="http://www.youtube.com/v/slwo4rBTQ00?version=3"><param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always"><embed src="http://www.youtube.com/v/slwo4rBTQ00?version=3" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always" width="640" height="390"></object>

Rock Band does a great job of inspiring people to play music, can you
develop a game that inspires composition? [Lumines][] and [Rez][] create
music while you play, can you make games where music creation is the
goal, not a side effect? [Pictionary][] does a great job of using game
mechanics to overcome creative block, can you use other game-like
constraints to inspire creativity? These were among the questions I
asked at [GameCamp 2][] a few months ago and I was keen to explore them
at [Music Hack Day London][] a week ago.

The spectrum of potential game-like musical composition tools is huge,
ranging from traditional recognisable music interfaces like keyboards
and step sequencers at one end, through things that are designed to be
both music interfaces and games like [Fractal][], Rez and Lumines in the
middle to things that are recognisably games at the other. While the
middle ground is incredibly interesting, 24 hours at a hack day isn’t
really long enough to develop a brand new revolutionary hybrid
game/music interface, so instead I decided to repurpose an existing game
as a sequencer and picked the simplest one I could think of — [Snake][].

With the interface chosen, the next thing to do was to think about how
to map the interface to music composition. The core mechanic in snake is
eating food placed on a grid. Grids have a venerable history in music as
[step sequencer][] interfaces with time growing form left to right and
pitch or samples selected on the y axis. It seemed natural to map food
position to note parameters in a similar way. Using the order in which
food is selected to determine the order of notes played frees up the X
axis to map to a parameter instead of time and also makes playing the
game feel more like a progression through a composition: each piece of
food adds to the sequence which is continually looping, the music plays
and the composition progresses, there is no turning back or revising. By
mapping the X axis to velocity pseudo rests can be added to the sequence
by selecting food on the left.

Selecting notes requires some deviation from the normal snake mechanics
which normally only make a single piece of food available at any time.
This restriction would mean that players wouldn’t compose music, simply
reveal it as they ate one piece of food at a time. At the other end of
the spectrum turning every square in to food would mean that the next
selected note would have to be adjacent to the last note, also overly
restrictive. Making a limited number of pieces of food available at any
time provides a nice middle ground, allowing the player some freedom in
the choice of the next note selected, but not total freedom, a
restriction which can lead to serendipitous melodies.

The other major mechanic in snake is colliding with your tail, which
ends the game, but becomes harder to avoid as you eat food and get
longer. One option would be to use that mechanic to intentionally end
the game and the composition, but instead I mapped it to sample
selection allowing the player to switch between sounds and start a new
sequence to build up multi-timbral polyphonic music. By making the world
toroidal players can simply let the snake circle around the world when
they have finished composing.

A lot of these design decisions came out while implementing the game
using [processing][]/[processing.js][] and
<span class="caps">HTML</span> 5 audio — a technology stack [I’d played
around with a bit previously][], but wanted to explore further. In the
end, for this kind of application I don’t think processing brings enough
benefit to outweigh the difficulties it adds to debugging. When running
on top of Java errors are often reported as mangled Java call stacks and
when running in the browser different errors appear as mangled
JavaScript. While I can see the attraction to language designers and
implementers of building on top of existing technology it often results
in having to implement in one language and debug horrible unrecognisable
code in another. Incompatibilities are also horrible. With a couple of
hours to go I had the entire game running on Java, but was presented
with a blank canvas with no useful Firebug errors when I exported to
processing.js and having to perform a binary search by commenting out
chunks of code to find the error. Not pleasant.

<span class="caps">HTML5</span> audio is also a somewhat fragile
technology. Generating an Audio element for each sample playback event
leads to current browsers grinding to a halt while resetting and
restarting audio elements often causes glitches and delays. Another
problem is that JavaScript timers don’t provide enough accuracy for
tight sequence playback timing. In the end I rebranded both bugs as
features by switching from very transient drum samples which sounded
messy to dubby bass and melancholy bell samples that work quite nicely
with glitches and unintentionally loose timing.

At <span class="caps">10PM</span> on Saturday night everything had come
together enough for me to lose myself in an hour of ambient bleepy
electronica and by the time the presentations started at
<span class="caps">3PM</span> on Sunday [Disco Snake][] was done.

I’d like to thank all of the organisers and hackers that made Music Hack
Day London a wonderful experience and have been pleasantly surprised at
the positive reaction that Disco Snake has generated over the last week.
The space between music interfaces and games is a very fertile one that
I’ll be exploring further in the future and while it’s not there yet, I
hope <span class="caps">HTML5</span> audio fulfils its promise of
bringing interactive music applications to everyone on the web in the
very near future.

  [Lumines]: http://en.wikipedia.org/wiki/Lumines
  [Rez]: http://en.wikipedia.org/wiki/Rez
  [Pictionary]: http://en.wikipedia.org/wiki/Pictionary
  [GameCamp 2]: http://jimpurbrick.com/2010/05/10/gamecamp-2/
  [Music Hack Day London]: http://london.musichackday.org/2010/
  [Fractal]: http://www.playfractal.com/
  [Snake]: http://en.wikipedia.org/wiki/Snake_%28video_game%29
  [step sequencer]: http://en.wikipedia.org/wiki/Music_sequencer
  [processing]: http://processing.org
  [processing.js]: http://processingjs.org
  [I’d played around with a bit previously]: http://jimpurbrick.com/2010/06/07/html-5-multimedia/
  [Disco Snake]: http://jimpurbrick.com/media/disco_snake/disco_snake.html
