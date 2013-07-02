Title: Caching Shared, Private Data With Ningx
Date: 2012-11-11 20:23
Tags: apis, caching, crest, devops, eve, lua, nginx, rest
Slug: caching-restricted-data-ningx

As with many other social services, a large amount of the data in
[<span class="caps">EVE</span> Online][] and [Dust 514][]‘s New Eden
universe is shared between subsets of users. Some corporation data
should only be accessible to the corporation’s members, market prices
should only be accessible to capsuleers and infantry in the region
for example.

</p>

In order to enforce these rules, the <span class="caps">EVE</span>
cluster performs a number of access control checks whenever a request is
made from an <span class="caps">EVE</span> client to the cluster. As a
large fraction of calls to the [<span class="caps">CREST</span>
<span class="caps">API</span>][] require these checks to be performed,
it would be nice to perform them in Nginx to avoid the overhead of
having to make a request to the <span class="caps">EVE</span> proxy
before returning the cached responses from Nginx. However, duplicating
the access control logic within Nginx and trying to keep the two access
control implementations in sync is likely to be error prone. As the
spying metagame in <span class="caps">EVE</span> is arguably bigger than
the game itself the consequences of getting the access control logic
wrong could be [huge][]. [Internet spaceships are serious business][].

</p>

Fortunately, it’s possible to combine and reuse the [load balancing][]
and [vary header][] support techniques previously discussed to avoid
both excessive calls from Nginx to the cluster and access control
logic duplication.

</p>

In addition to annotating responses from the cluster with the address of
the proxy containing the character’s session, we also annotate the
response with the character’s location, corporation and various other
character meta data. The same logic that performs access control checks
in the cluster can then add these response headers to the list of vary
headers when generating a cache key for a later request on behalf of the
same character. Rather than duplicating access control logic, Nginx just
needs to make sure that only response headers from the cluster are used
for these access control vary headers. If a particular
<span class="caps">URI</span> is annotated to vary on language and
region for example, Nginx will allow the language to be supplied by the
client, but the region must be supplied by the cluster in a previous
response for the same character.

</p>

By reusing the stateful load balancing and vary header support we added
to Nginx we’re able to cache data shared between multiple characters
without duplicating complex access control logic implemented by the
<span class="caps">EVE</span> cluster: reducing the
<span class="caps">CREST</span> load on the
<span class="caps">EVE</span> cluster without breaking the metagame.

</p>

Thanks to [@jonastryggvi][] for working with me on the Caching support
and [@CCPGames][] for allowing me to blog about it.

</p>

  [<span class="caps">EVE</span> Online]: http://www.eveonline.com/
  [Dust 514]: http://www.dust514.com/
  [<span class="caps">CREST</span> <span class="caps">API</span>]: http://wiki.eveonline.com/en/wiki/CREST_Documentation
  [huge]: http://themittani.com/content/soss-3-bad-crazy-internet-space-0
  [Internet spaceships are serious business]: http://uk.ign.com/articles/2012/05/24/internet-spaceships-are-serious-business
  [load balancing]: http://jimpurbrick.com/2012/07/30/load-balancing-stateful-services-nginx/
  [vary header]: http://jimpurbrick.com/2012/10/14/adding-vary-header-support-nginx/
  [@jonastryggvi]: https://twitter.com/jonastryggvi
  [@CCPGames]: https://twitter.com/CCPGames
