Title: Another Age Must Be The Judge
Date: 2010-09-29 16:15
Tags: c-sharp, linden lab, mono, second life, virtual worlds
Slug: another-age-must-be-judge

<a href="http://www.flickr.com/photos/jimpurbrick/5036038669/" title="Babbage Linden by Jim Purbrick, on Flickr"><img src="http://farm5.static.flickr.com/4130/5036038669_67dcd2aeac.jpg" width="500" height="281" alt="Babbage Linden" /></a>

Almost exactly 6 years ago, the incredible [Cory Ondrejka][] and I met
for the first time in real life (having previously blogged together on
[Terra Nova][]) at the [Austin Game Conference 2004][], where we got on
like a house on fire. Several months later I joined Linden Lab and (as
James and Jim Linden were already taken) Babbage Linden was born. The
first task Cory asked me to do was embed the [Mono virtual machine][] in
to [Second Life][] as a next generation scripting engine. It was a
wonderful project to work on, involving authoring a new
<span class="caps">LSL</span> compiler back end to generate
<span class="caps">CIL</span> bytecode, a scavaging garbage collector to
allow assembly unloading and a microthread injector to allow 10s of
1000s of scripts to run concurrently on Mono in a single process (work
that has been described in detail in talks at [ooPSLA][],
[Lang.<span class="caps">NET</span>][] and
[<span class="caps">FOSDEM</span>][] ). As a long term R&D project it
was put on hold a number of times to make way for more important
projects like [<span class="caps">HTTP</span>-Out][], [Message
Liberation][] and [Het-Grid][], but eventually we shipped a [Second Life
simulator that embedded Mono][] in 2008.

Running <span class="caps">LSL</span> on Mono in Second Life was a huge
win, allowing scripts to run 100s of times faster in some cases and
reducing the average memory footprint of scripts in Second Life by a
third, but the big hairy audatious goal for Mono in Second Life was
always to enable other languages that targeted the Common Language
Infrastructure to run in Second Life. After waiting until the end of
last year for [Mono 2.6][] to implement the bytecode verifier and
[CoreCLR security][] sandbox which allowed us to safely run other
languages on Mono inside the simulator we started work on adding support
for C\# in Second Life at the beginning of this year. A team of Linden
engineers in Brighton and California did an amazing job overcoming an
array of challenges and got to the point where we had Silverlight chess
demos, run time configurable script profilers and scripts that used
.<span class="caps">NET</span> reflection APIs to visualize other C\#
scripts running in our development simulators earlier this summer.

Alas, tomorrow is my last day at Linden Lab and Babbage Linden will
never get to see C\# scripts running in the wild in Second Life, but I
very much hope that I do. I hope that C\# support is eventually added to
Second Life and that I don’t have to wait 170 years to turn the handle.
As another [Babbage][] said when he failed to build the [Difference
Engine][]: “Another age must be the judge”.

  [Cory Ondrejka]: http://ondrejka.net/
  [Terra Nova]: http://terranova.blogs.com/
  [Austin Game Conference 2004]: http://terranova.blogs.com/terra_nova/2004/09/dont_mess_with_.html
  [Mono virtual machine]: http://www.mono-project.com/Main_Page
  [Second Life]: http://secondlife.com/
  [ooPSLA]: http://www.oopsla.org/oopsla2007/
  [Lang.<span class="caps">NET</span>]: http://langnetsymposium.com/2009/talks.aspx
  [<span class="caps">FOSDEM</span>]: http://jimpurbrick.com/2010/03/14/fosdem-x-movie/
  [<span class="caps">HTTP</span>-Out]: http://wiki.secondlife.com/wiki/LlHTTPRequest
  [Message Liberation]: http://wiki.secondlife.com/wiki/Message_Liberation_Forum_Transcript
  [Het-Grid]: http://wiki.secondlife.com/wiki/Het-Grid_FAQ
  [Second Life simulator that embedded Mono]: http://wiki.secondlife.com/wiki/Release_Notes/Second_Life_Server/1.24
  [Mono 2.6]: http://www.mono-project.com/Release_Notes_Mono_2.6
  [CoreCLR security]: http://blogs.msdn.com/b/shawnfa/archive/2007/05/09/the-silverlight-security-model.aspx
  [Babbage]: http://en.wikipedia.org/wiki/Charles_Babbage
  [Difference Engine]: http://en.wikipedia.org/wiki/Charles_Babbage#Difference_engine
