Title: Testing Replicated Redux
Date: 2017-07-31 20:29
Tags: vr, javascript, simulation, development, software engineering
Slug: testing-replicated-redux

Opening a couple of browser windows and clicking around was more than
sufficient for testing the initial version of [ReactVR
pairs](http://jimpurbrick.com/2017/01/04/vr-redux/). Implementing a
simple middleware to log actions took advantage of the
[Redux](http://redux.js.org/) approach of reifying events to allow a
glance at the console to reveal precisely which sequence of actions
caused a problem.

Adding support for [optimistic
consistency](http://jimpurbrick.com/2017/07/04/react-vr-redux-revisited/)
made testing more challenging. In order to test conflict resolution,
conflicting actions needed to be generated on multiple clients almost
simultaneously. After a couple of sessions testing broken versions of
pairs with friends it was clear that a more efficient process was
required. Fortunately Redux actions are independent of the UI events
which generate them. This separation of concerns made it trivial to
randomly generate and dispatch actions without driving the UI. Opening
clients dispatching several randomly generated actions per second made
it easy to generate conflicts to test optimistic consistency policies
while watching games play out made it easy to eyeball the results to
check that they were correct. This random action generation mechanism
can be enabled by adding `?random` as the query string when opening
the Pairs example in a browser.

<div class="flex-video"><iframe width="560" height="315" src="https://www.youtube.com/embed/RgjhPTVjjQI?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe></div>

One of the problems found by this approach was that clients didn't
always end up eventually consistent. One client would end up with all
squares shown and all pairs scored, while another would have some
squares hidden. After some digging it turned out that in these cases
the master would be reducing a `hide` action followed by a `score`
action, while the other client would reduce the actions in the reverse
order, causing the `hide` acton to be invalid. Without a way for a
non-master client to let the master know about the conflict the master
would not send a `sync` action and the clients would not end up
eventually consistent.

This problem identified a limitation with the optimistic
`clientPredictionConsistency` policy: if any sequence of action causes
a conflict then every ordering of those actions must also cause a
conflict in order for the clients to end up eventually consistent. The
fix for the `hide`-`score` case seemed clear: if the `score` action
was only valid if the pair was shown then both orderings of those
actions would generate a conflict and so the master would generate a
sync action regardless of the order in which it reduced the actions.
Some more eyeballing seemed to suggest that the problem had been
solved, but a better way to test the property that `sync` action
generation is independent of action order was to write a property
based test.

Fortunately some Googling revealed that my Facebook colleague [Lee
Byron](https://twitter.com/leeb) had written a JavaScript property
based testing framework called
[test-check](https://github.com/leebyron/testcheck-js) which was
compatible with the [Jest](https://facebook.github.io/jest/) framework
used by [ReactVR](https://facebook.github.io/react-vr/) tests.  After
a small amount of hacking I had a test which could generate an
arbitrary sequence of actions, dispatch them and check that if the
sequence of actions generated a `sync` action then dispatching the
same sequence of actions in reverse would also generate a `sync`
action. I could now test that the property held for 1000s of action
sequences in a few seconds and so I found the next bug almost
immediately. While my change to make any ordering of test then hide
generate a sync had fixed one problem it had introduced another. The
validity of `score` events was now dependent on the preceding `show`
events, so it was possible for `show`, `show`, `score` to be valid but
for every other order of those events to cause the `score` event to be
invalid and so not reduced.

<script src="http://gist-it.appspot.com/https://github.com/facebook/react-vr/blob/1b1d323cf0063e57c60a7209369cd8097dfb9beb/Examples/Pairs/property.spec.js?slice=114:134&footer=0"></script>

At this point I took a step back. The only situation that should cause
a conflict that needs to be resolved is when more than one player
tries to `score` the same pair. In this situation clients don't have
enough information to resolve the conflict and a master client needs
to pick an ordering and communicate the result to the other
clients. In the case of `hide` and `score` actions every client can do
the right thing. Hide actions can be made to not hide scored squares
and score actions can be made to show pairs. With the reducers changed
to work in this way hide actions can always be reduced and score
actions are only invalid when they conflict with each other. With
these changes in place the validation logic becomes dramatically
simpler to reason about and the property based tests were unable to
find any more cases which would not be eventually consistent even
after 1000s of runs.

Testing distributed systems is hard, but combining replicated Redux
with property based tests has proved to be a powerful way to gain a
high degree of confidence that applications will work correctly
despite limitations in the current simplistic
`clientPredictionConsistency` mechanism. The same property based tests
will enable new optimistic consistency mechanisms without those
limitations to be developed far more quickly in future.

If you'd like to play the ReactVR version of pairs or see the rest of
the code, it's available on github
[here](https://github.com/facebook/react-vr/tree/master/Examples/Pairs).

All code in this post is made available under the [ReactVR examples
license](https://github.com/facebook/react-vr/blob/master/LICENSE-examples).
