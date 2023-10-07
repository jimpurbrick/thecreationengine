Title: BL:AM
Date: 2023-10-07 19:00
Tags: software, games, hardware, hack, c++, art, engineering, software engineering
Slug: blam

After [The Spirit of Gravity](https://spiritofgravity.com/) in February I ended up talking to [Jason Hotchkiss](https://hotchk155.blogspot.com/) and [Jo Summers](https://twitter.com/profaniti) in the Rossi Bar. I knew Jason from a [Build Brighton](https://buildbrighton.com/) guitar pedal workshop years ago and more recently as a sound artist from the [Sound Plotting](https://soundartbrighton.com/productions/sound-plotting/) event [Alien Alarms](https://alienalarms.bandcamp.com/) played at, but Jo knew Jason as a game developer who made [1D Pong](https://www.youtube.com/watch?v=b7CsDeUTwxM) which she included in a [Pop Up Arcade](https://twitter.com/pressfiretowin) years ago. After talking about another [1D dungeon crawler](https://www.aipanic.com/projects/wobbler) we started thinking about the most ridiculous 1D game we could imagine in 2023 and settled on 1D, 1 button battle royale.

Normally that’s where the story would end, but for some reason the idea kept rattling around in my head and I ended up putting my thoughts down in a [Google Doc](https://docs.google.com/document/d/17NDLoDa17drcMevKgGfAccfIcZB-v6BC2UhEinW_hpQ/edit?usp=sharing) and started thinking about how to make it happen.

To be a [battle royale](https://en.wikipedia.org/wiki/Battle_royale_game) the game had to be a multiplayer last-person-standing shooter with players positioned on a shared map with the goal of eliminating the other players, but a 1D display meant the gameplay couldn’t come from aiming. Judging the distance to shoot by charging and launching a missile solved this problem and provided a fun core gameplay loop which could be implemented with a single button. Hold the button to charge the missile then release the button to fire a distance dependent on the time the button was depressed.

![First Multiplayer Game](https://jimpurbrick.com/media/blam/first_multiplayer.png "First Multiplayer Game")

With the button used for shooting, moving players around had to rely on another key feature of battle royale games: the shrinking map. The game would start with a large map filling the display and would distribute players randomly on the map as they joined. Periodically the map would shrink and randomize the player positions within the smaller play area. This would create a natural tempo increase in the game as players would move closer together, so players could fire shorter distances and so fire more often. Eventually all the players would be next to each other, so just tapping a button would always result in hitting a player, ensuring the game came to a swift end.

Jason had already suggested the [Raspberry Pi Pico](https://www.raspberrypi.com/products/raspberry-pi-pico/) as a potential hardware platform, so I built a prototype as a Linux terminal application which outputs frames as lines of ASCII to quickly test the design and potentially be easy to port to the hardware. The first prototypes were surprisingly fun. Some tweaking of the map resize period gave good players enough time to range-find long distances while not making weaker players wait too long if they were a long way from the action. As the map got smaller the action got more frantic before ending in a flurry of button mashing as planned.

The slow pace at the start gave players enough time to learn how to play, but could feel frustrating when all the targets were at the other end of the map. A solution came by adding loot boxes, another feature common to battle royale games. By distributing loot boxes across the map players would always have something nearby to shoot when there wasn’t enough time to target players on the other side of the map. Scattering loot boxes randomly around the map also helped to make maps feel varied and provided a way to add depth via different upgrades and another way to move by teleporting.

Loot boxes also added another interesting gameplay choice: should I try to snipe an opponent immediately or get tooled up first? The initial design always fired missiles at the nearest target, which Jo highlighted as a problem as it reduced agency and meant you couldn’t always pick your target. An easy solution was to alternate the direction of fire. Just tapping the button meant players could quickly launch a missile in the wrong direction before getting back to carefully charging a shot to fire in the right direction again.

![USB serial to Pico](https://jimpurbrick.com/media/blam/putty_pico.png "USB serial to Pico")

After playtesting the software version at [The Brighton Indie Gamedev](https://www.meetup.com/brighton-indie-gamedev_events/) social, I was convinced that the game was fun and started thinking about hardware. I expected it to be a lot of work to get running on the Pico, especially as I’d allowed myself to joyride some relatively new C++ features like lambdas and auto parameter types, but g++ happily took my fancy code and cross compiled it without any complaints. I could also use PuTTY to connect to the Pico as a USB serial device to see the ASCII output, which was incredibly useful while testing the hardware without the LED display and then for debugging problems while getting the display working.

I ended up with a hardware main function (which wired the inputs up to the Pico pins and redirected the output to the USB serial interface), a terminal main function (which used some hacks to get unbuffered keyboard presses) and renderTerminal and renderRgb methods implemented by the game objects. The rest of the code was shared between the two builds, allowing me to quickly develop, test and debug the game using VS Code and gdb, then cross compile and drag a binary to the Pico mounted as a USB drive.

<div class="flex-video"><iframe width="640" height="360"
src="https://www.youtube.com/embed/lnvEGkbQg2w?feature=player_detailpage"
frameborder="0" allowfullscreen></iframe></div>

In May I got the chance to play 1D Pong at Jason’s studio which made me realize how important audio is when you only have a 1D display: the sounds of balls bouncing off bats and points being scored did a lot to explain what was going on, so I started thinking about adding sound to 1D battle royale. The Pico doesn’t have a digital to analogue converter, but some experimentation showed that it can generate some gloriously grungy sounds by using pulse width modulation to play samples using one of the digital outputs. After aggressively compressing some of [ProjectsU012](https://freesound.org/people/ProjectsU012/)’s arcade sounds and converting them to 8 bit samples stored in header file arrays, the game came to life. Instead of being a quirky, abstract 1D game it was a battle royale complete with missiles whooshing and exploding and players powering up and teleporting around.

![Brighton Indie Gamedev](https://jimpurbrick.com/media/blam/brighton_indie_gamedev.jpg "Brighton Indie Gamedev")

I haven’t made a game in a long time and I’ve never made a hardware game, so this project has been a lot of fun. It’s also something that I couldn’t have done without Jason, Jo and everyone at the Brighton Indie Gamedev socials: thank you to everyone for your help and feedback.

![One Button Controllers](https://jimpurbrick.com/media/blam/blam_controllers.jpg "One Button Controllers")

![Dreamy Hardware](https://jimpurbrick.com/media/blam/dream_hardware.jpg "Dreamy Hardware")

I’m very excited that the “Battle Lines: Arcade Machine” (BL:AM) will be part of the free [Pop Up Arcade](https://dreamy-place.com/pop-up-arcade-at-dreamy-place/) at the [Dreamy Place Festival in Crawley](https://dreamy-place.com/events/crawley/) from the 12th-14th of October. Come along and have a play!