Title: ReactVR Redux Revisited
Date: 2017-06-15 20:20
Tags: vr, javascript, simulation, development, software engineering
Slug: react-vr-redux-revisited

There were a couple of aspects of my [previous
experiments](http://jimpurbrick.com/2017/01/04/vr-redux/) building
networked [ReactVR](https://facebook.github.io/react-vr/) experiences
with [Redux](http://redux.js.org/) that were unsatisfactory: there
wasn't a clean separation between the application logic and network
code and, while the example exploited idempotency to reduce latency
for some actions, actions which could generate conflicts used a
conservative consistency mechanism which added a at least a network
round trip to those actions. So, I did some more hacking.

In an attempt to create a clean separation between application and
network logic I kept the network code in a redux middleware and moved
the application logic to an isValid callback which returns true if an
action can be safely reduced:

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/da1c9371d889ace2411c0fbacbb725a7d3610a91/Examples/Pairs/reducers/validate.js?slice=27:44&footer=0"></script>

With this in place the simple, conservative, dumbTerminalConsistency
policy can be implemented in a few lines of code:

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/da1c9371d889ace2411c0fbacbb725a7d3610a91/Examples/Pairs/replicate.js?slice=20:37&footer=0"></script>

Clients generate actions in response to UI interactions and send those
actions to the master. The master returns valid actions which are then
reduced.  Conflicts are resolved by serializing actions through the
master client: isValid will return true for the first event, which
will be distributed to all clients, but false for subsequent
conflicting actions which are discarded. All clients see a single,
consistent view at the cost of a round-trip to the master for all
actions.

The same isValid method can be reused to implement an optimistic
clientPredictionConsistency policy which treats the clients as
decoupled simulations:

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/da1c9371d889ace2411c0fbacbb725a7d3610a91/Examples/Pairs/replicate.js?slice=39:59&footer=0"></script>

When using this middleware, clients immediately reduce actions which
are valid given their local state and distribute local actions to all
other clients. If a conflict is detected, the master client uses the
same setState mechanism used to allow late joining to reset the
decoupled simulations to the master state. The effects of actions are
seen immediately at the cost of occasionally seeing the effects of
actions roll back when the state is reset. By designing reducers to be
idempotent and making the isValid callback as permissive as possible
the number of state reset actions can be minimized. In the case of
pairs, state resets only occur when two clients try to get the points
for the same pair, or if a client tries to hide half of a pair which
has been scored.

Testing pairs with the two different consistency policies over a high latency
ngrok connection gives wildly different experiences. With dumbTerminalConsistency
introducing 500ms round-trip latencies between clicking and seeing results the
experience feels laggy, slow and clumsy. With clientPredictionConsistency
the effects of local actions are seen with 0 latency and the experience is fast,
snappy and frantic. Glitches caused by state resets are occasionally jarring,
but often go unnoticed as the focus of attention is on the board during the game
before switching to the scores at the end once they are eventually consistent.
While it may make sense to use conservative consistency for some applications,
pairs definitely benefits from an optimistic approach.

Being able to independently develop application logic and consistency
mechanisms is extremely valuable. While developing the pairs example I
was able to get the dumbTerminalConsistency middleware working, then
the pairs game logic and then switch between the
dumbTerminalConsistency and clientPredictionConsistency policies to
determine whether I had a problem with the game logic or middleware
while getting optimistic local updates working. I could imagine a
similar approach being valuable for other applications. Conservative
consistency could be used during development, then optimistic
consistency policies could be experimented with to find the right
trade off between latency and consistency without worrying about
breaking the application logic by mixing in tightly coupled local
update logic.

Its easy to imagine more sophisticated optimistic consistency
mechanisms: middleware which generates anti-events to avoid full state
resets when the state becomes too large, approaches which use Redux
time travel approaches to rewrite history when conflicts are detected
or policies which extrapolate predictions or interpolate corrections
to avoid discontinuities for example. Many of these approaches could
be implemented in generic ways, but developers would still have the
option to build middleware which exploits application specific
knowledge where appropriate.

The Redux approach of defining the next state as a function of an
action applied to the current state lends itself to building
sophisticated decoupled simulations. I hope to see these approaches
become standard in networked ReactVR applications in the near
future. Modern VR hardware provides incredibly low motion to photon
latency and it would be a shame to see the sense of presence it can
create broken by the network round-trips inherent in client-server
architectures. Optimistic updates, client prediction and zero latency
should be the default.
