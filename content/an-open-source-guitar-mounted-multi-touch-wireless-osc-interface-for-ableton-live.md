Title: An Open Source, Guitar Mounted, Multi Touch, Wireless, OSC Interface for Ableton Live
Date: 2009-12-17 10:58
Tags: ableton live, iphone, music, open source, osc, wifi
Slug: open-source-guitar-mounted-multi-touch-wireless-osc-interface-ableton-live

![Guitar mounted iPhone controller][]

</p>

([100 robots images][] by [Steve Marshall][] )

</p>

Ever since playing with iPhones as music interfaces with the [London
Community iPhone OSCestra][] at Open Hack London in May I’ve been
wondering how I could use my iPhone as a controller in my
rock/electronic band [100 robots][]. The 100 robots set up has Max and I
playing live drums and guitar over a number of tracks played from
[Ableton Live][]. If I could mount an iPhone on the guitar I could
manipulate the tracks playing from Ableton making the whole experience
more varied and live and less like 2 people playing over a
backing track.

</p>

The biggest problem with using the OSCestra set up with 100 robots is
that we run Ableton on Windows with 100 robots so that we can use a
number of plugins that aren’t available on <span class="caps">OS</span>
X. This stopped us using the <span class="caps">OS</span> X
[Osculator][] to convert <span class="caps">OSC</span> data from Mrmr in
to <span class="caps">MIDI</span> data that we could feed to Ableton —
the really simple and easy solution that I recommend if you’re using
<span class="caps">OSC</span> and Ableton on
<span class="caps">OS</span> X.

</p>

Some quick Googling showed that we could potentially use the open source
and incredibly powerful pd to read <span class="caps">OSC</span> and
send <span class="caps">MIDI</span> to Ableton, but pd seemed a bit
heavy weight and complex to use just for controller mapping in a live
environment which needs to be stable and predictable under heavy load
while streaming 6 audio tracks and recording 2 tracks live.

</p>

Some more research I discovered [LiveAPI][]: an open source project that
gives access to the Python interpreter embedded in Ableton Live. LiveAPI
allows you to write python code which listens to events from Ableton and
allows control of Ableton from python code. Conveniently LiveAPI also
includes LiveOSC an <span class="caps">OSC</span> server that quickly
allows you to map <span class="caps">OSC</span> messages from
applications like Mrmr to [Python][] methods that use LiveAPI to
control Ableton.

</p>

In the end it only took a couple of hours and a few lines of Python code
to rig up Mrmr on the iPhone to control Ableton on Windows and a few
minutes more to build a guitar mount for the iPhone from a cable tie and
a piece of gaffa tape.

</p>

Using the iPhone live with 100 robots:

</p>

</p>

(Cinematography by [David Packer][])

</p>

Despite being a really quick hack to build, LiveAPI is somewhat fiddly
to set up, so I thought I should document the process of wiring things
up. If you’d like to build your own open source, guitar mounted multi
touch, osc interface for Ableton Live 8 running on Windows, follow
these instructions:

</p>

1.  Install [Mrmr][] on your iPhone or iPod touch
2.  Design your Mrmr interface using a text editor. If you have a Mac,
    you can use the [interface builder][]. The 100 robots mmr file is
    [here][]
3.  Upload the mmr file to a web server.
4.  Connect the iPhone to the same network as the computer
    running Ableton.
5.  Run Mrmr on the iPhone, download the mmr file from your web server
    to get your interface running on the iPhone
6.  Download [LiveOSC][]
7.  Unpack the LiveOSC zip in to a new LiveOSC folder created inside the
    Resources/<span class="caps">MIDI</span> Remote Scripts directory in
    your Ableton installation.
8.  Edit Resources/<span class="caps">MIDI</span> Remote
    Scripts/LiveOSCCallbacks.py to add new callbacks for Mrmr to the
    \_\_init\_\_ method of the LiveOSCCallbacks class. Widgets are
    numbered sequentially from 0 in the mmr file, so this line registers
    a callback for the first widget in the file. The 100 robots
    callbacks look like this:

    </p>

    <p>
        """ 100robots callbacks """self.callbackManager.add(self.toggleBass, "/mrmr/pushbutton/0/iPhone1")

9.  Add methods to Resources/<span class="caps">MIDI</span> Remote
    Scripts/LiveOSCCallbacks.py to respond to the messages from Mrmr.
    These can use LiveAPI freely to control ableton. The 100 robots
    callbacks toggle the first parameter of effect racks on different
    tracks to turn them on and off:

    </p>

    <p>
        def toggleBass(self, msg):    """Called when a /mrmr/pushbutton/0/iPhone1 message is received."""    track = 38    device = 0    parameter = 0    value = msg[2]    LiveUtils.getSong().visible_tracks[track].devices[device].parameters[parameter].value = value

10. Select LiveOSC as a control surface in the Ableton preferences. This
    will load the LiveOSCCallbacks.py and set up your mappings. Interact
    with the controls in Mrmr and see Ableton Live respond!

</p>

The full, modified 100 robots [LiveOSCCallbacks.py][].

</p>

[My presentation on the hack][] at the [£5 App Christmas Special][]
which includes more details on the Ableton Live routing we use.

</p>

  [Guitar mounted iPhone controller]: http://farm3.static.flickr.com/2720/4125718215_c4e704cb4f.jpg
  [100 robots images]: http://www.flickr.com/photos/steviebm/sets/72157622856858738/
  [Steve Marshall]: http://nascentguruism.com/
  [London Community iPhone OSCestra]: http://jimpurbrick.com/2009/05/12/london-geek-community-iphone-oscestra/
  [100 robots]: http://100robots.com
  [Ableton Live]: http://www.ableton.com/
  [Osculator]: http://www.osculator.net/
  [LiveAPI]: http://createdigitalmusic.com/2007/06/06/liveapiorg-new-open-source-unofficial-sdk-in-python-lets-you-hack-ableton-live/
  [Python]: http://www.python.org/
  [David Packer]: http://jimpurbrick.com/feeds/atom/blog/www.sheepfilms.co.uk
  [Mrmr]: http://poly.share.dj/projects/#mrmr
  [interface builder]: http://poly.share.dj/downloads/mrmr_interfacebuilder_1.2.zip
  [here]: http://jimpurbrick.com/media/100robots.mmr
  [LiveOSC]: http://monome.q3f.org/wiki/LiveOSC
  [LiveOSCCallbacks.py]: http://jimpurbrick.com/media/LiveOSCCallbacks.py
  [My presentation on the hack]: http://vimeo.com/7967321
  [£5 App Christmas Special]: http://ianozsvald.com/2009/12/04/fivepoundapp_xmas_musical_special/
