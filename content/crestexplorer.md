Title: crestexplorer
Date: 2016-08-21 21:48
Tags: eve, ccp, technology, rest, web, tools, github, javascript

<div class="flex-video widescreen"><iframe src="https://www.youtube.com/embed/zYU2lier4GA" frameborder="0" allowfullscreen=""></iframe></div>

At the 3rd Party Dev State of the Union at EVE Fanfest 2016 earlier
this year, CCP FoxFour drew my attention to a limitation of the
current approach used by
[crestmatic](http://jimpurbrick.com/2016/01/03/crestmatic/) to
generate CREST documentation: it only discovers resources always
reachable from the API root from the perspective of the authorised
character at generation time. As CREST now includes APIs for transient
resources like
[fleets](https://forums.eveonline.com/default.aspx?g=posts&t=475607)
the entire API isn't reachable for documentation from a nightly run
using the credentials of a character not in a fleet.


There are a couple of ways to fix this. At the API level OPTIONS
responses could refer to linked representations that can exist. An
alternative is to extend
[crestexplorerjs](http://jimpurbrick.com/crestexplorerjs/#https://crest-tq.eveonline.com/)
with OPTIONS metadata to make it expose live documentation about
reachable resources.

At a recent hackathon I took the second approach. crestexplorer now
makes OPTIONS requests to each resource it requests and uses
[crestschema](https://github.com/jimpurbrick/crestschema) and data
urls to generate downloadable [JSON
schema](http://json-schema.org/latest/json-schema-core.html)
descriptions for each of the representations available for a
resource. It also hyperlinks to the alternative representations so now
all representations of all reachable resources are available in
crestschema and the human readable descriptions of each field are
added to the rendered resource as hovertext.

Now documentation for any valid CREST resource live
by specifying the URI for the resource as the crestexplorer hash
fragment. Even when the resources are transient documentation is
available for resources while they exist.