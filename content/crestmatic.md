Title: crestmatic
Date: 2016-01-03 23:13
Tags: eve, ccp, technology, rest, web, api, travis, ci, tools, github

<div class="flex-video widescreen"><iframe src="http://www.youtube.com/embed/QMQOjUjrZIo" frameborder="0" allowfullscreen=""></iframe></div>

A year ago I gave a talk at [EVE Vegas](http://vegas.eveonline.com/)
about building RESTful CREST applications. My [#1
recommendation](https://youtu.be/QMQOjUjrZIo?t=697) was to specify
representations in requests, but that's hard to do when there is
little documentation on which representations are available and what
they contain.

Fortunately CREST is that it’s [self
describing](https://www.youtube.com/watch?v=QMQOjUjrZIo&t=1369): you
just need to send an OPTIONS request to a CREST URI and the API will
send a list of methods and representations that can be used with that
URI. The data returned isn’t in a standard format, so I built the
[crestschema](https://github.com/jimpurbrick/crestschema) library
which can convert the CREST format in to a more useful [JSON
schema](http://json-schema.org/latest/json-schema-core.html)
format. The library is designed to work both in browsers, in
applications like
[crestexplorer](https://github.com/jimpurbrick/crestexplorerjs), and
from [node](https://nodejs.org/). From node applications like
[crestschemaspider](https://github.com/jimpurbrick/crestschema/blob/master/crestschemaspider.js)
can crawl the CREST API to find representations which can be converted to
JSON schema and saved to disk. The schemas can then be used with
wide variety of [software, libraries and
languages](http://json-schema.org/implementations.html) to validate
data from the live CREST API, generate parsers or automatically generate
documentation.

With the JSON schemas collected it was possible to build
[crestmatic](https://github.com/jimpurbrick/crestmatic) which uses
crestschema and [matic](https://github.com/mattyod/matic) to generate
documentation. The final steps were to add a
[travis](https://travis-ci.org/) step to publish the generated
documentation to the [crestmatic gh-pages
branch](http://jimpurbrick.com/crestmatic/) and to use
[nightli.es](https://nightli.es/) to trigger a build every night to
ensure that the documentation is kept up to date. Please feel free to
fork the repo, submit a pull request if you'd like to see some changes
or just donate some ISK to Capt Out if you find the documentation or
code useful.
