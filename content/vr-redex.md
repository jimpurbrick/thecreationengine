Title: VR Redux
Date: 2017-01-04 20:20
Tags: vr, javascript, simulation, development, software engineering
Slug: vr-redux

[Mike](https://twitter.com/m1k3) and I have been talking about how to
easily build simple networked social applications with
[ReactVR](https://facebookincubator.github.io/react-vr/) for a while,
so I spent some time hacking over the Christmas break to see if I
could build a ReactVR version of the pairs game in [Oculus
Rooms](https://www.youtube.com/watch?v=MqAGl2JmH4I). Pairs is simple
and fun, but also interesting as it’s real time and has the potential
to generate conflicting updates that need to be resolved.

[Redux](http://redux.js.org/) seemed like a promising starting point
as it reifies events and allows flexible event processing in a similar
way to
[MASSIVE-3](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.100.7556).
I used
[websockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)
as they are already supported by ReactVR along with
[wsrelay](https://www.npmjs.com/package/wsrelay) to network the
clients.

With those pieces in place the simplest way to network the clients is
to implement a middleware function to send every action generated in
one client to all the others. In the case of actions which show a tile
this is sufficient as the action is idempotent. If two players click
on a square at the same time, the order that the actions are reduced in
doesn’t matter: in either case the result is that the element is
revealed. We can exploit the idempotency by optimistically processing
the action locally before sending it to other clients to minimise
network latency.

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/b08617a360082bb43181b4597bdf75b2b8ca99db/Examples/Pairs/index.vr.js?slice=53:60&footer=0"></script>

Scoring is trickier. While each client can tell when a pair has been
revealed, only the first player to reveal the pair should score a
point. As the actions to reveal tiles are potentially processed in
different orders on each client that could lead to inconsistent scores
even if only the first is processed. A simple way to avoid this
inconsistency is to nominate one client to be the master and only have
that client generate score actions. This can be implemented as another
middleware to avoid generating actions inside a reducer.

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/b08617a360082bb43181b4597bdf75b2b8ca99db/Examples/Pairs/reducers/board.js?slice=101:109&footer=0"></script>

The master client can also be made responsible for sending the current
state of the simulation to new clients to support late joining.

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/b08617a360082bb43181b4597bdf75b2b8ca99db/Examples/Pairs/index.vr.js?slice=91:119&footer=0"></script>

With those parts done the app is usable and makes an interesting
example of one possible way to network ReactVR applications. This was
the first time I’d used React, ReactVR or Redux and I was very
impressed by how easy to use and flexible they are. With the addition
of some small pieces of middleware Redux can be used to implement a
distributed simulation with flexible consistency mechanisms to trade
off latency and consistency. The pairs example shows that even within
a simple application applying different consistency mechanisms to
different actions and parts of the application state is useful.

The next things to experiment with are using
[WebRTC](https://webrtc.org/) to allow peer to peer communication
between clients to further reduce latency, add a server to allow
trusted and hidden state and allowing clients to subscribe to a subset
of actions to allow heterogeneous clients and [interest
management](https://scholar.google.com/scholar?q=interest+management+virtual+environments&hl=en&as_sdt=0&as_vis=1&oi=scholart&sa=X&ved=0ahUKEwi3peaslYXOAhVM6iYKHZ_pCd8QgQMIJTAA).

If you'd like to play the ReactVR version of pairs or see the rest of
the code, it's available on github [here](https://github.com/facebook/react-vr/tree/master/Examples/Pairs).