Title: Anything But Java
Date: 2008-10-06 13:28
Tags: aarhus, agile, cloud, conference, denmark, jaoo, jaooaarhus2008, secondlife, talk
Slug: jaoo-denmark

<a href="http://www.flickr.com/photos/jimpurbrick/2918267608/" title="The Shakespeare Language by Jim Purbrick, on Flickr"><img src="http://farm4.static.flickr.com/3270/2918267608_8777eb7547.jpg" width="500" height="412" alt="The Shakespeare Language" /></a>

Last week I was invited to talk at [<span class="caps">JAOO</span>
Denmark][]. Originally a Java conference, <span class="caps">JAOO</span>
is now a very broad software development conference covering everything
from agile to language design to distributed systems.

The stand out talk on the first day was [Gregor Hohpe][]‘s [Programming
the Cloud][] which enumerated some of the problems with building
distributed systems without call stacks, transactions, promises,
certainty or ordering constraints and then outlined some approaches to
overcome them including looking at real life situations which also have
to deal with the lack of distributed transactions. For example at
Starbucks your coffee is made concurrently with your payment being taken
and then problems are fixed up afterwards if you can’t pay, they can’t
make the coffee or they get the order wrong. The throughput gained from
optimistic concurrency is greater than the loss of having to fix things
up, even if it means that sometimes you end up giving away free coffee.

</p>

Unfortunately I missed [Lars Bak’s V8 keynote][] on Tuesday, but was
really impressed by [Successfully Applying
<span class="caps">REST</span>][] by [Stefan Tilkov][] which enumerated
<span class="caps">REST</span> patterns and anti-patterns shining some
light on the subtleties of a technology which initially seems straight
forward but turns out to have some pot holes for the unwary.

</p>

The highlights on Wednesday were [seeing Guy Steele and Dick Gabriel
give their 50-in-50 talk][] again (which is still not available on-line,
but one of the highlights is [here][]) and [seeing][] the new [WeDo lego
robotics platform for kids][] which will be available next summer. The
most relevant talk was [Test Driven Development, Take 2][] by [Erik
Doernenburg][] which got me thinking about how to do dynamic mock
objects in C++. My talk on [embedding Mono in Second Life][] went down
well and elicited some good questions, although as a fringe topic it
wasn’t heavily attended.

</p>

Other highlights included [Erik Meijer’s keynote on fundamentalist
functional programming][], [Bill Venners][] [talk on Scala][], hearing
[Patrick Linskey][] conclude that the way to [make Java scale][] is to
use Scala or Erlang, [James Copland][] reinventing
<span class="caps">OO</span>, playing guitar at the jam session and
hearing Erik suggest to Lars that we compile
<span class="caps">LSL</span> to <span class="caps">CIL</span> and run
it on V8 modified to capture thread state while Erik was spilling half
bottles of Champagne over people and Lars was swaying and stumbling
around the room.

</p>

  [The Shakespeare Language]: http://farm4.static.flickr.com/3270/2918267608_8777eb7547.jpg
  [![The Shakespeare Language][]]: http://www.flickr.com/photos/jimpurbrick/2918267608/
    "The Shakespeare Language by Jim Purbrick, on Flickr"
  [<span class="caps">JAOO</span> Denmark]: http://jaoo.dk/conference/
  [Gregor Hohpe]: http://jaoo.dk/speaker/Gregor+Hohpe
  [Programming the Cloud]: http://jaoo.dk/file?path=/jaoo-aarhus-2008/slides//GregorHohpe_ProgrammingCloud.pdf
  [Lars Bak’s V8 keynote]: http://jaoo.dk/presentation/V8%3A+The+JavaScript+Engine+Inside+Google+Chrome
  [Successfully Applying <span class="caps">REST</span>]: http://jaoo.dk/file?path=/jaoo-aarhus-2008/slides/StefanTilkov_RESTPatterns.pdf
  [Stefan Tilkov]: http://jaoo.dk/speaker/Stefan+Tilkov
  [seeing Guy Steele and Dick Gabriel give their 50-in-50 talk]: http://www.flickr.com/photos/jimpurbrick/2918267608/
  [here]: http://www.catonmat.net/blog/wp-content/plugins/wp-downloadMonitor/user_uploads/the_eternal_flame-god_wrote_in_lisp.mp3
  [seeing]: http://www.flickr.com/photos/jimpurbrick/2918268902/
  [WeDo lego robotics platform for kids]: http://jaoo.dk/file?path=/jaoo-aarhus-2008/slides//EikThyrstedBrandsgard_LEGO.pdf
  [Test Driven Development, Take 2]: http://jaoo.dk/file?path=/jaoo-aarhus-2008/slides//ErikDornenburg_TDD2.pdf
  [Erik Doernenburg]: http://jaoo.dk/speaker/Erik+D%C3%B6rnenburg
  [embedding Mono in Second Life]: http://jaoo.dk/file?path=/jaoo-aarhus-2008/slides//JimPurbrick_ChallengesSecondLife.pdf
  [Erik Meijer’s keynote on fundamentalist functional programming]: http://jaoo.dk/presentation/Why+Functional+Programming+%28Still%29+Matters
  [Bill Venners]: http://jaoo.dk/speaker/Bill+Venners
  [talk on Scala]: http://jaoo.dk/file?path=/jaoo-aarhus-2008/slides//BillVenners_scalaFirehoseCompressed.pdf
  [Patrick Linskey]: http://jaoo.dk/speaker/Patrick+Linskey
  [make Java scale]: http://jaoo.dk/file?path=/jaoo-aarhus-2008/slides//PatrickLinskey_DesigningForScalability-JAOO.pdf
  [James Copland]: http://jaoo.dk/speaker/James+O.+Coplien
