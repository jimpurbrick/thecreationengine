Title: Towards A Generic Media Type System
Date: 2016-04-17
Tags: REST,APIs,CREST,CCP,EVE,GraphQL

The early days of RESTful hypermedia API design tends to involve lots of
homogeneous collections. In the case of CREST vnd.ccp.eve.Api-v1
pointed to the logged in vnd.ccp.eve.ccp.Capsuleer-v1 which pointed to
a vnd.eve.ccp.CharacterCollection-v1 of contacts which pointed to many
vnd.ccp.eve.Capsuleer-v1 representations, one for each capsuleer contact.

Adding search makes things more complicated. A typical search resource
will accept a query and return a collection of hyperlinks to
heterogeneous resources. EVE allows capsuleers to have contacts that
might be other capsuleers, agents, corporations or alliances. In the
future capsuleers may also be able to have coallitions in their
contacts list. In this hypothetical future a contacts management
application developed now would end up receiving search results that
it wouldn't understand. After requesting a resource and receiving an
unknown representation the client can ignore the resource, but it
would be better to filter out unknown resources as part of the query.

Server side filtering is typically added to search via extra query
parameters. In our CREST example we might add q=Jayne&type=capsuleer
parameters if we just wanted to find the capsuleer Jayne Fillon. An
unfortunate consequence of this design is that we end up with
application level types used to filer searches as well as Media Types
used for HTTP content negotiation.

It would be nice to just use content negotiation, but we want to
filter the resources that are referenced by the returned resource, not
the returned representation itself. The search request might return a
vnd.ccp.eve.Collection-v1 representation, but we want to make sure
that the hyperlinks in that collection only point to
vnd.ccp.eve.Capsuleer-v1 resources.

As a client we'd like to specify is that we want search to return a
vnd.ccp.eve.CollectionOfCapsuleerReferences. If the client wants to
include corporations in the search results it should be able to
specify a CollectionOfCapsuleerOrCorporationReferences. We'd like a
richer media type system.

While this could be implemented in the backend just by switching on
the Accept type, the combinatorial explosion of potential search
results quickly makes this impractical. A simpler way to experiment
with this approach would be to implement a proxy which can query the
API for Collection-v1 representations and convert them in to arbitrary
CollectionOfFooAndBarReference representations.

The proxy could also be used to inline reprsentations, allowing
clients to request a CollectionOfFooAndBars rather than a collection
of hyperlinks. If clients only wanted a subset of the full Foo and Bar
representations thay might ask for
CollectionOfJustNameFromFooAndJustNameFromBars. These additions would
address some of the biggest headaches caused by API designers who have
to decide which fields to denormalise in to collection resources to
avoid clients having to make a huge number of requests in order to
provide meaningful choices to users.

This approach potentially provides a lot of the benefits of GraphQL to
RESTful clients just through normal HTTP content negotiation protocols
and maintains the benefits of maintaining a small number of versions
to API developers. If a composite type refers to a type which is
deprecated in the underlying API, it can return as deprecated response
as normal.

As with programming languages, it seems that if we're going to support
strong media types it's useful to also support generic media types.

