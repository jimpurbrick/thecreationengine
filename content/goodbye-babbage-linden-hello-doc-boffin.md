Title: Goodbye Babbage Linden, Hello Doc Boffin
Date: 2010-10-23 14:04
Tags: combatcards, games, secondlife, virtualworlds
Slug: goodbye-babbage-linden-hello-doc-boffin

In June 2004, not long after [Cory][] had introduced me to [Second
Life][], version 1.4 was released which added Custom Character
Animations. In the accompanying [press release][] Philip said “My
fantasy is to be Uma Thurman in Kill Bill”, “I’d pay \$10 for her yellow
jumpsuit and sword moves and I’m sure other people would too.” I’d been
looking for something to build in <span class="caps">SL</span> and also
been thinking about melee combat systems in RPGs which traditionally
just leave the tanks hacking away while the others get loads of
different fun and interesting abilities to use. At the other end of the
spectrum arcade fighting games give players lots interesting choices to
make, but require twitch reflexes that require low latencies that are
difficult to achieve over networks let alone in
<span class="caps">SL</span>. Building a tactical melee combat game in
Second Life sounded like the kind of interesting challenge I was looking
for, so at the end of 2004 Doc Boffin and Jaladan Codesmith set out to
build what would become [Combat Cards][].

The early versions of the game were built in to weapons and employed a
simple [llDialog][] interface for selecting moves, but the core
mechanics were very much as they are now. HUDs were introduced In
October 2005 with Second Life 1.7 and I immediately started thinking
about converting the game in to a trading card game — a business model
that seemed to fit perfectly with Second Life’s micro currency
based economy.

A trading card game needed an artist and after looking for one on the
<span class="caps">SL</span> forums I was very lucky to find the
wonderful [Osprey Therian][] who preceded to blow my mind producing
amazing artwork and taking incredible pictures of the fantastic avatars
of Second Life for what became Combat Cards.

Working on the game while working at Linden Lab gave me insights in to
how Second Life felt from a residents perspective. Despite Second Life’s
flexibility, it’s a lot harder to build complex systems than it should
be. Building systems that can send out product updates is fiddly, error
prone and something that should be in the platform,
<span class="caps">LSL</span>’s memory limitations mean that I often
spent more time cutting scripts up or trying to save memory than
building features. When the number of cards and so data increased,
Combat Cards ended up having to incorporate a paging system to load
lines of notecard data in to memory asynchronously in order to continue
to work. This hugely frustrating and time consuming experience led
directly in to the discussions and design around [Script Limits][] which
will allow Mono scripts to request as much memory as they needed.

Learning about building businesses in Second Life was also incredibly
valuable. As a multi-player only game, Combat Card’s biggest challenge
has always been getting enough people together at the same time to play,
something that has resulted in a series of wonderful parties and regular
events often hosted by the amazing Kat Burger. It also resulted in the
exploration of linking Second Life with social media that led to Combat
Cards arenas tweeting game results and then the
[<span class="caps">LSL</span> Twitter OAuth Library][] that allowed
players to tweet results from their own accounts without [disclosing
their Twitter passwords][]. When we finally found a print on demand
service that allowed Combat Cards to make the jump to
<span class="caps">RL</span> it also allowed us to explore the
possibilities for linking <span class="caps">RL</span> and
<span class="caps">SL</span> businesses that resulted in the system for
buying gift certificates for L\$ in <span class="caps">SL</span> that
can be redeemed for physical Combat Cards in the online [web][]
[shops][].

Keeping my Babbage Linden and Doc Boffin identities separate for over 6
years has given me incredible insight in to what it’s really like to be
a Second Life resident, but it has been exhausting. There was an awkward
moment in 2006 when I had to tell Philip that I worked for him when he
came to check out Combat Cards, Osprey only found out that I was a
Linden in 2008 when I emailed her a version of the
<span class="caps">RL</span> rules sheet that Word had helpfully
annotated with my name and I had to come up with a dweeby Doc Boffin
voice to disguise my identity when commentating on Combat Cards matches
on [YouTube][]. It’s a huge relief to finally be able to come out of the
closet and talk about Combat Cards openly. I’m incredibly proud of what
Osprey, Jaladan and I have achieved with the help of Kat, Comragh, Spin
and our amazing player base, to whom I apologize to for sometimes not
being able to devote as much time as I’d like to Combat Cards. My other
Second Life as Babbage Linden often kept me pretty busy.

Now that I’ve left Linden Lab I hope to still find some time to work on
Combat Cards and hope that it will now be easier to pursue the full
publication of Combat Cards in real life that Osprey’s amazing artwork
deserves. I’m very happy to announce that Combat Cards 3.0 and the long
awaited [Robot Series][] of cards will be launching on 31 October and
hope to see you all at the launch party at <span class="caps">2PM</span>
Pacific (Second Life time) at the [Combat Cards Arenas in Europa][].
I’ll leave you with Osprey’s latest amazing promo for the event.

<div class="flex-video"><object width="640" height="385"><param name="movie" value="http://www.youtube.com/v/4IPQOc_H3HY?fs=1&amp;hl=en_GB"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/4IPQOc_H3HY?fs=1&amp;hl=en_GB" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="640" height="385"></embed></object></div>

  [Cory]: http://ondrejka.net/
  [Second Life]: http://secondlife.com
  [press release]: http://lindenlab.com/pressroom/releases/04_06_15
  [Combat Cards]: http://combatcards.co.uk
  [llDialog]: http://wiki.secondlife.com/wiki/LlDialog
  [Osprey Therian]: http://twitter.com/osprey
  [Script Limits]: http://blogs.secondlife.com/community/technology/blog/2009/12/15/script-limits
  [<span class="caps">LSL</span> Twitter OAuth Library]: http://wiki.secondlife.com/wiki/Twitter_OAuth_Library
  [disclosing their Twitter passwords]: http://adactio.com/journal/1357/
  [web]: http://us.shop.combatcards.co.uk/
  [shops]: http://uk.shop.combatcards.co.uk/
  [YouTube]: http://www.youtube.com/user/CombatCards
  [Robot Series]: http://googoogoggles.dreamhosters.com/CombatCards/Robot.html
  [Combat Cards Arenas in Europa]: http://slurl.com/secondlife/Europa/101/138/56
