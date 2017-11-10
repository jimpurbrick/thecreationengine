Title: Replaying Replicated Redux
Date: 2017-11-10 22:56
Tags: vr, javascript, simulation, development, software engineering
Slug: replaying-replicated-redux

While [property based tests proved to be a powerful tool for finding
and fixing problems with ReactVR
pairs](http://jimpurbrick.com/2017/07/31/testing-replicated-redux/),
the limitations of the simplistic `clientPredictionConstistenty`
mechanism remained.

It's easy to think of applications where one order of a sequence of
actions is valid, but another order is invalid. Imagine an application
which models a door which can be locked: an `unlock` action followed
by an `open` action should be valid, but an `open` action followed by
`unlock` should be invalid given a starting state where the door is
locked. It's a lot more difficult to imagine how every ordering of
this simple sequence of actions can be made either valid or invalid.

The limitation of `clientPredictionConsistency` is caused by the
master client having to see an invalid action before it notices that
clients need resyncing. An obvious way to avoid this limitation would
be to have all other clients let the master know if they have seen an
invalid action, but this solution becomes more complicated when you
want to avoid the master sending duplicate sync actions if multiple
clients report invalid actions simultaneously.

At this point, I took a step back: even if clients could report
conflicts without duplicate resyncs, the improved
`clientPredictionConsistency` would centralise conflict resolution in
the master. Clients receiving a state sync action would have no
context on the conflict and so would be unable to do anything more
than reset their local state. Reusing the state sync mechanism which
allows late joining is simple, but doesn't allow anything more than
effectively rejoining.

One of the nice things about Redux actions is that they are more
meaningful than either UI events or state updates: it would be nice if
clients could use the context they have in the actions to resolve
conflicts and reconcile optimistic updates with authoritative actions
gracefully. This made me think of the [optimistic update mechanism
used by Half
Life](https://developer.valvesoftware.com/wiki/Latency_Compensating_Methods_in_Client/Server_In-game_Protocol_Design_and_Optimization)
which keeps a list of actions which have been predicted locally and
reapplies the predictions to new states received by the server. [Redux
was built to easily support this kind of time
travel](https://www.youtube.com/watch?v=xsSnOQynTHs) through
application history, so I wondered whether something similar could be
built for replicated redux.

Some hacking on these ideas produced `replayConsistency`: a
generalisation of the Half Life optimistic update ideas applied to
arbitrary Redux actions. When a non-master client generates a valid
local action it is sent to the master, immediately reduced locally,
but also appended to a list of predicted actions. When the client
recieves a new action from the master it rewinds the state back to the
start of the prediction, applies the new master validated action and
then reapplies the predicted actions if they are still
valid. Eventually every predicted action becomes part of the total
ordering defined by the series of actions validated by the master and
is sent back to the client, or the state which caused the prediction
to be invalid on the master is reached on the client. In either case
the prediction is discarded. In the case where a prediction becomes
invalid the client has the state before the prediction, the action
which invalidated the prediction and the list of predicted actions
available when `updatePredictions` is called and so is able to do
something significantly more sophisticated to fix the local state than
simply reseting the entire state due to a state sync. In fact
`replayConsistency` does not need to send state syncs at all, making
it significantly more efficient than `clientPredictionConsistency`
which I renamed `resyncConsistency` to make the differences between
the two optimistic consistency policies clear.

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/506c98dcd4a94bdee22431ef719e0bfbfa65b591/Examples/Pairs/replicate.js?slice=134:159&footer=0"></script>

Switching out `resyncConsistency` for `replayConsistency` and
eyeballing several games of ReactVR Pairs suggested that the new
consistency mechanism was working as intended, but finding all of the
kinks in `resyncConsistency` had required testing thousands of
sequences of actions using property based tests. My existing tests
didn't apply here: they made sure that an application would work given
the limitations of `resyncConsistency`. The property I really wanted
to ensure held for all consistency mechanisms is that regardless of
the predictions made at each client, eventually all clients would be
consistent.

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/506c98dcd4a94bdee22431ef719e0bfbfa65b591/Examples/Pairs/property.spec.js?slice=157:216&footer=0"></script>

This test generates a sequence of pairs actions which might be sent by
the master or one of two non-master clients and then checks that all
clients are eventually consistent even in the pathological case where
each non-master predicts all of its actions before getting any actions
from the master. A nice feature of this test is that it is independent
of the consistency mechanism and so the same test can be run to ensure
that both `resyncConsistency` and `replayConsistency` result in all
clients being eventually consistent for thousands of sequences of
actions.

With my tests passing I had high confidence that `replayConsistency`
was working and didn't impose any limitations on event ordering making
it a much more general and efficient solution than `resyncConsistency`
as well as much easier to use as it doesn't require complicated
reasoning about application event ordering. The potential to perform
sophisticated application specific state reconciliation when
predictions are invalidated rather than simply jumping to a new state
is also interested and I'm excited to see what we can do with it in
future.

If you'd like to play the ReactVR version of pairs or see the rest of
the code, it's available on github
[here](https://github.com/facebook/react-vr/tree/master/Examples/Pairs).

All code in this post is made available under the [ReactVR examples
license](https://github.com/facebook/react-vr/blob/master/LICENSE-examples).
