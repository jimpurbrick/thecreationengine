Title: Beyond Time Dilation?
Date: 2014-01-29
Tags: eve, virtualworlds, simulation, pubsub, technology

![The Battle of B-R5RB](http://i.imgur.com/LOVyhw4.jpg "The Battle of B-R5RB")

EVE online is [a remarkable game](http://community.eveonline.com/news/news-channels/eve-online-news/eve-online-featured-in-applied-design-at-the-museum-of-modern-art/). On Monday [over 2000 people
spent over 20 hours destroying virtual spaceships worth 200,000 USD in
real money](http://themittani.com/news/b-r5rb-biggest-battle-all-eve) in what was the likely the largest battle in a video game
ever. That EVE is capaple of supporting such large engagements is an
amazing technical achievement, that thousands of players are willing
to invest huge amounts of time and money in to a game that recently
celebrated its 10th anniversary is an amazing game design achievement.

The reason that the scale of EVE battles continue to
break records and make headlines is the introduction of [Time
Dilation](http://massively.joystiq.com/2011/10/02/eve-evolved-time-dilation-and-the-war-on-lag/) (TiDi) in 2012. When the server simulating a solar system in
EVE becomes unable to keep up with the rate of updates from connected
clients it slows the simulation down so it can keep up. Before TiDi the
server would become overloaded and start failing to process commands
from players. After time dilation, game time slows down, but commands
continue to processed fairly for all players. Up to a point.

In order to ensure that battles eventually get resolved, TiDi is only
allowed to slow the simulation down to 10% of it's normal speed, so at
10% TiDi one second of simulation time passes for every 10 seconds of
real time. The 20+ hour Battle of B-R5RB on Monday was eventually
brought to a halt due to a server upgrade, if TiDi was allowed to
continue past 10% this would become increasingly common and battles
would often be decided by one side's willingness to put up with more
simulation slowdown than the other.

In part due to the extra real time that TiDi gives players to join in,
the scale of large EVE battles have now grown to the point where they
regularly push TiDi to 10%, server CPU to 100% and cause the old
problems of failing updates to reappear, as was seen in [The Battle Of HED-GP](http://themittani.com/news/day-servers-didnt-die) a week ago in which many of the attacking
forces were unable to issue commands successfully and so were
destroyed. The limits of TiDi to allow battles in EVE online to scale
up have been reached.

In his [analysis of The Battle of HED-GP](http://community.eveonline.com/news/dev-blogs/what-a-hed-ache/), [CCP Veritas](https://twitter.com/CCP_Veritas), talks about "one
of the bounding scaling factors in large fleet fights, the unavoidable
O(n2) situation where n people do things that n people need to
see". Avoiding this bounding scaling factor may be one way to allow
EVE battles to scale beyond the limits of TiDi.

As the [amazing screenshots from B-R5RB](http://imgur.com/a/10lG2) show, large scale battles in
EVE quickly become difficult to navigate. With 1000s of pilots in
space, simply finding the ship you want to target becomes hard. As a result EVE provides an overview that lists the ships
in nearby space. This overview can be sorted in a number of ways
allowing a particular ship to be selected and multiple lists can be
set up filtering out different subsets of things in space. Often during a
battle pilots will use an overview set up to only show enemy ships to
avoid targeting friendly ships, for example.

Pushing these filtering settings to the server may be one way to scale
EVE battles beyond the limits of TiDi. In the case where all pilots
have their overview set up to only show enemy ships we would have a
situation where n people do things that n/2 people need to see. With
more aggressive filtering that only showed interacting ships plus the
nearest ship of each type plus ships piloted by known pilots plus
ships broadcast to your fleet it might be possible to get to a
situation where the number of things people need to see does not
depend on the number of people in a battle. The O(n2) problem could be avoided
without significantly changing EVEs game play mechanics. If the number
of ships of each type were also sent to the client, the overview could still
be populated with one entry per ship, albeit with missing information,
allowing for situations where fleets want to spread their fire rather
than focussing it.

One potential weakness with this approach is that it would allow
pilots to force the server back in to doing O(n2) work by simply
disabling thier overview filters, something that might become
impossible to resist in a situation where it's clear that your fleet
is going to lose hundreds of thousands of real dollars worth of
virtual spaceships. In the Battle of B-R5RB, one side had ships filled
with autonomous drones which they apparently chose not to deploy to
avoid server load, but might well have decided to deploy if they had
started losing the battle.

A potential solution here would be to prioritise updates from players
with more aggressive filtering settings. If the server runs out of
time at the limits of TiDi it simply stops processing updates and
starts on the next frame, penalising pilots with too liberal filtering
settings who could be made aware that their updates are being dropped
by the UI. This would encourage pilots engaged in the battle to
aggressively filter while potentially still allowing non-combatants to
capture the occasional screenshot or even video of the entire battle.

Another weakness of this approach is that pilots will no-longer see
every ship in the battle rendered at the correct position in space. A
similar approach to populating the overview could be taken here by
rendering the correct number of ships of each type at ranges beyond
the minimum range for each type, or more symbolic approaches could be
used to display the number of ships in the 3D scene. I did some
related work on rendering [symbolic abstractions of 3D environments in
MASSIVE-3](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&arnumber=840515) many moons ago.

I no longer have a copy of the EVE source code to check whether any of
this is possible and even when I was working on [CREST](https://wiki.eveonline.com/en/wiki/CREST_Documentation) I didn't look at
the simulation code in EVE much at all, but this might be one way
around the O(n2) problem that currently limits the size of EVE
battles. However they choose to tackle it, I wish CCP Veritas and
the newly rehydrated Team Gridlock all the best in their scaling work
and look forward to reading stories of ever more epic space battles
for the next 10 years.