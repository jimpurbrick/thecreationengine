Title: The London Geek Community iPhone OSCestra
Date: 2009-05-12 00:34
Tags: apple, drwho, geek, hackday, iphone, music, nintendo, wii, yahoo
Slug: london-geek-community-iphone-oscestra

<embed src="http://blip.tv/play/AYGAx2aB6RA" type="application/x-shockwave-flash" width="640" height="510" allowscriptaccess="always" allowfullscreen="true"></embed> 

</p>

On Friday evening while mulling over potentially interesting hacks to
build at [Open Hack London][] I remembered an idea I’d had a while ago:
there are now loads of interesting ways to use iphones as music
interfaces and the iphone to hacker ratio at hack days tends to be
around 1, so you could probably put together an entire iPhone orchestra.

</p>

With only a few hours left before heading to London I started rummaging
around on the internet to find the bits I needed. I’d looked at the
various iPhone music interface apps over Christmas and
[<span class="caps">ITM</span> MidiLab][] had been the easiest to use,
but although I could start up multiple iTouchMidi servers listening on
different ports, I couldn’t send the output of the servers to different
<span class="caps">MIDI</span> ports, making it impossible to
distinguish between multiple iPhones.

</p>

Next I looked at the [<span class="caps">OSC</span>][] based iPhone
apps: [OSCemote][], [TouchOSC][] and [mrmr][]. Of these, mrmr was the
easy choice as it is free as in beer and speech, allowing me to extend
it if needed. It also allows custom interface design via scripting
allowing for potentially interesting <span class="caps">UI</span>
hacking at open hack. <span class="caps">OSC</span> is also an [open
standard][], so as a last resort I’d be able to build a server that
could listen to multiple devices.

</p>

With the client settled on I started looking at existing software to run
on my laptop to convert <span class="caps">OSC</span> data in to
<span class="caps">MIDI</span> to control [Ableton][]. The first thing I
looked at was [pd][], an incredibly powerful data processing environment
that can understand <span class="caps">OSC</span> and generate
<span class="caps">MIDI</span>. As well as being incredibly powerful, pd
also has an incredibly steep learning curve and time was running out, so
despite having used it in the past and wanting to use open source
software for my hack, I eventually gave up on pd and tried
[OSCulator][].

</p>

OSCulator is incredibly easy to use. Within minutes I had multiple
<span class="caps">OSC</span> servers listening on different ports, my
iPhone had connected to each of them and I’d set up mappings from dozens
of <span class="caps">OSC</span> inputs to
<span class="caps">MIDI</span> controllers. OSCulator also supports up
to 8 Wiimotes connected via bluetooth, so I chucked a couple of wiimotes
my bag, tested the iPhone could connect to an Ad Hoc WiFi network
created on my MacBook Pro, threw a Dr Who <span class="caps">MIDI</span>
file in to Ableton and then got some sleep.

</p>

After booking a slot for the non-existant iPhone orchestra during the
hack demos, I set out to make it exist. With a combination of arm
twisting and volunteering I convinced 8 plucky hackers to join the
orchestra then spent a few hours auditioning synth patches in Ableton
and assiging <span class="caps">MIDI</span> controllers to their
parameters and tweaking iPhone accelerometer smoothing settings in
OSCulator to get a couple of Wiimotes working as drums.

</p>

I managed to organise an hour’s rehearsal on Saturday afternoon where we
spent the first half trying to connect all of the devices and the second
huddled around the laptop trying to hear the audio from the built in
speakers. After a bit more tweaking I set up a 3rd Wiimote to launch
loops and start and stop the set, allowing me to get in on the fun while
conducting and borrowed an amp for our second and final rehearsal.

</p>

The performance was a hoot. We’d been having trouble getting all of the
devices to connect to OSCulator at the same time and Simon Willison’s
iPhone refused to connect for the final performance, which freed him up
to concentrate on hamming it up with a look of intense concentration. I
also managed to completely lose track of where we were in the music, so
Jon Markwell’s haunting theremin solo section ended up following an
embarrasing silence when his part wasn’t actually playing. All in all
though, I think we did pretty well and it went down a storm with the
assembled geeks.

</p>

Many thanks to [Ryan Alexander][], [Jonathan Markwell][], [Natalie
Downe][], [Nigel Crawley][], [Matt Jarvis][], [Simon Willison][] and
Matthew Smith for indulging me once again at hack day — it was loads of
fun. There are more videos and photos of the performance in my
[delicious stream][].

</p>

  [Open Hack London]: http://openhacklondon.pbworks.com/FrontPage
  [<span class="caps">ITM</span> MidiLab]: http://itouchmidi.com/
  [<span class="caps">OSC</span>]: http://opensoundcontrol.org/
  [OSCemote]: http://lux.vu/blog/oscemote/
  [TouchOSC]: http://hexler.net/software/touchosc
  [mrmr]: http://poly.share.dj/projects/#mrmr
  [open standard]: http://opensoundcontrol.org/spec-1_0
  [Ableton]: http://www.ableton.com
  [pd]: http://puredata.info/
  [OSCulator]: http://www.osculator.net/wp/
  [Ryan Alexander]: http://rnalexander.wordpress.com/
  [Jonathan Markwell]: http://jimpurbrick.com/feeds/atom/blog/www.jonathanmarkwell.com/
  [Natalie Downe]: http://natbat.net/
  [Nigel Crawley]: http://www.nigelcrawley.co.uk/
  [Matt Jarvis]: http://www.mattjarvis.co.uk/
  [Simon Willison]: http://simonwillison.net/
  [delicious stream]: http://delicious.com/JimPurbrick/londongeekcommunityiphoneoscestra
