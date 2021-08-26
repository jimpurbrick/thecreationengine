Title: Virtual Objects You Can Touch
Date: 2021-08-26 14:26
Tags: MMORPG, SocialVR, Second Life, EVE Online, VR, Facebook, Oculus, Virtual Worlds
Slug: virtual-objects-you-can-touch

![Horizon Workrooms](https://lh3.googleusercontent.com/BBgwIQ10Dlfdxo9ZK8BSx-EaVHNgfxEfmU2vMMgO6qeYsVdmkClP3yHfplA35EwtgNiQzMAwjjonR2xKgkLey0d7MQ5Hea2eMW-mkJORaelxLdP2oHo3BTi5lD2Zuolm78_1Hzf6u4M=w2400 "Horizon Workrooms")

Now that [Horizon
Workrooms](https://www.oculus.com/experiences/quest/2514011888645651/)
has launched I’m very happy to be able to write about the
functionality that I found most exciting while building the
experience: the mapping of virtual objects to their real world
counterparts.

Typically augmented and mixed reality experiences overlay real world
objects with virtual annotations. An AR app on your phone might
recognize a face seen by the camera and show the face with added bunny
ears on the phone screen, for example. Workrooms is different in that
it shows you an entirely virtual environment, but asks you to
[indicate the position of real world objects like your
desk](https://youtu.be/lgj50IxRrKQ?t=7) in a process which feels like
a more detailed [guardian setup
process](https://www.youtube.com/watch?v=d73PfTXZDvo). Workrooms then
positions your avatar in the virtual world so that your real desktop
aligns with your virtual desktop. When you reach out and touch the
virtual desk your hands touch the real desk. As long as the important
virtual objects within arms reach are mapped to real objects, the
virtual environment can be much bigger than the available real space
while maintaining the illusion that every virtual object can be
touched as well as seen.

In addition to adding to the immersion and realism of the experience,
the haptic feedback has important practical benefits. Typing on a
virtual keyboard is much easier if you’re also typing on a real
keyboard rather than on a flat featureless surface or just moving your
fingers in space; it is much less tiring to draw on a virtual
whiteboard if you are also leaning on a real wall and it’s much less
dangerous to show someone a virtual desk if leaning on it or putting a
coffee on it doesn’t result in you falling over or spilling coffee on
your feet. While requiring a suite of real objects to be available
puts some additional constraints on using the application, the
required objects are common enough in the case of Workrooms that the
trade off is often worthwhile and less onerous than requiring the use
of specialised additional VR hardware to provide much lower fidelity
haptic feedback.

Mapping real objects to virtual objects can also go beyond providing
haptic feedback by being used to provide a very natural indication of
intent. Moving from a seated desk to a nearby wall in the real world
can be used to indicate to an application the intent to use a
whiteboard and might result in teleporting in the virtual world to a
whiteboard location much further away, allowing people to navigate
virtual spaces which are much larger than the available space in the
real world.

<div class="flex-video"><iframe width="640" height="360"
src="https://www.youtube.com/embed/lgj50IxRrKQ"
frameborder="0" allowfullscreen></iframe></div>

Using real objects that can be touched shifts the problem of providing
[haptic feedback](https://en.wikipedia.org/wiki/Haptic_technology)
from one requiring complex mechanical force feedback devices to one
that, in future, would use computer vision to recognise objects in the
real environment using the same cameras that provide [inside-out
tracking](https://en.wikipedia.org/wiki/VR_positional_tracking#Inside-out_tracking)
capabilities in modern VR headsets. By using virtual objects that map
exactly to their real counterparts the haptic feedback provided would
be perfect. A real MacBook keyboard feels exactly like a MacBook
keyboard when you touch it because it is a MacBook keyboard, whereas
any force feedback device trying to synthesize the same haptic
feedback could only ever provide an approximation.

While the relative ubiquity of home offices means that this mapping
approach lends itself to an experience like Workrooms, it’s also
exciting to think about how similar approaches could be used to add
perfect haptic feedback to less mundane VR experiences in more
fantastic virtual environments. The Workrooms team was lucky enough to
see some of those possibilities during a team offsite to the [Star
Wars VR experience at the
Void](https://www.youtube.com/watch?v=xbrIJdu6Gn0) in London. The
experience created the illusion of a large virtual environment using a
much smaller real space by using tricks like having participants
moving through a real doorway into a virtual elevator and then later
exiting through the same doorway to a new virtual room once the
elevator had virtually moved to a new floor in the virtual
environment.

<div class="flex-video"><iframe width="640" height="360"
src="https://www.youtube.com/embed/xbrIJdu6Gn0"
frameborder="0" allowfullscreen></iframe></div>

With the increasing availability of headsets which use
[SLAM](https://en.wikipedia.org/wiki/Simultaneous_localization_and_mapping)
based inside-out tracking and the development of techniques like
[redirected
walking](https://en.wikipedia.org/wiki/Redirected_walking), it’s
possible to imagine a future where rather than defining a safe cuboid
within the real world, guardian systems could instead map an entire
home or office, identifying doors, chairs, tables and other objects
which could be enumerated via an API to VR applications. The
application could then use the available real world features to
generate huge custom fantasy environments in a rogue-like game in
which every wall and table can be leant on, every door can be opened
and closed, every chair sat in and potentially every staircase
climbed. I’m very excited to see, hear and touch the experiences these
techniques might enable in the near future.