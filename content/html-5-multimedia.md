Title: HTML 5 multimedia
Date: 2010-06-07 23:14
Tags: html 5, music, technology, web
Slug: html-5-multimedia

I’ve been morbidly fascinated by the [Rich Internet Application][]
technology blood bath for a while now: [Whirled][],[Metaplace][] and
others tried to stuff virtual worlds in to web pages using Flash,
[Second Life][] stuffed Flash in to virtual worlds via [Webkit][],
[Unity][] stuffed [Mono][] in to a 3D engine and then took on the world
and [Silverlight][] and [Moonlight][] stuffed the
<span class="caps">CLR</span> in to web browsers and [Erik Meijer][]
stuffed a <span class="caps">CIL</span> interpreter straight in
to Javascript.

All good fun and there are fortunes to be won and lost to be sure, but
the smart money seemed to be on waiting for the dust to settle and then
using the winning technology. Recently, however, amazing technologies
like [V8][], [Node.js][] and the resulting browser Javascript arms race
have been adding weight to the Google viewpoint that all you need is
Javascript: a philosophy made more pragmatic by Apple’s [decree][] that
all you get is Javascript.

A week or so ago I decided to test the hypothesis by building a drum
machine using only [<span class="caps">HTML</span> 5][] and Javascript.
My first discovery was that while the canvas element is perfectly
capable, it’s a very low level <span class="caps">API</span>, even for
building something as rudimentary as a step sequencer interface. After
looking at a number of drawing libraries I settled on [processing.js][]
as a higher level drawing <span class="caps">API</span>, something I’ve
been meaning to play with since we used it to build [SLorpedo][] at Hack
Day a few years ago. Processing.js is a neat hack, that despite an
incomplete <span class="caps">API</span> and some subtleties around
casting does a great job of running processing sketches within a browser
without a plugin. It also uses a sloppy parser enabling you to drop
arbitrary Javascript in to your processing sketch, which makes it easy
to just create Audio() objects within the sketch to playback audio.
Unfortunately while it was easy to add audio playback, the playback
itself was pretty disappointing: Firefox just spluttered and belched
sadly while Safari did a decent job of playing beats for a couple of
minutes before its timing went to hell and then the browser crashed. The
shiny future may yet be <span class="caps">HTML</span> 5 and Javascript,
especially when the [experimental extensions to Firefox][] become widely
supported, but we’re not there yet.

  [Rich Internet Application]: http://en.wikipedia.org/wiki/Rich_Internet_application
  [Whirled]: http://www.whirled.com/
  [Metaplace]: http://www.metaplace.com/
  [Second Life]: http://secondlife.com
  [Webkit]: http://webkit.org/
  [Unity]: http://unity3d.com/
  [Mono]: http://www.mono-project.com/Main_Page
  [Silverlight]: http://www.silverlight.net/
  [Moonlight]: http://www.mono-project.com/Moonlight
  [Erik Meijer]: http://en.wikipedia.org/wiki/Erik_Meijer_%28computer_scientist%29
  [V8]: http://code.google.com/p/v8/
  [Node.js]: http://nodejs.org/
  [decree]: http://www.apple.com/hotnews/thoughts-on-flash/
  [<span class="caps">HTML</span> 5]: http://en.wikipedia.org/wiki/HTML5
  [processing.js]: http://processingjs.org/
  [SLorpedo]: http://andypiper.wordpress.com/2007/06/17/slorpedo/
  [experimental extensions to Firefox]: https://wiki.mozilla.org/Audio_Data_API
