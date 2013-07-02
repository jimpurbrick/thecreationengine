Title: HTML 5 Audio Redux
Date: 2010-09-04 12:01
Tags: audio, html5, music, music hack day
Slug: html-5-audio-redux

<p>My recent experiments in to using <a href="http://processingjs.org/">Procssing.js</a> and <a href="http://www.w3schools.com/html5/tag_audio.asp">HTML5 audio</a> to generate multimedia web applications <a href="http://jimpurbrick.com/2010/06/07/html-5-multimedia/">didn't get very far</a>. I first tried generating a new HTML 5 audio element for each audio event, which quickly caused the browser to grind to a halt, and my attempts to reuse audio elements by resetting the playback position didn't seem work, leading me to conclude that HTML 5 audio was only really useful for playing back long audio files, not for building sequencers that play back many short samples. When I spoke to <a href="http://remysharp.com/">@rem</a> about my findings he was convinced that resetting audio elements should be possible and this weekend's <a href="http://london.musichackday.org/2010/">Music Hackday London</a> has provided the perfect incentive and opportunity to dust off my experiments and start tinkering again. An hour in and sure enough I've managed to get audio elements to reset: it seems that the trick is to set currentTime after calling play() on the element, something that seems very counter-intuitive, but seems to work (at least in Firefox 3.6.8 and Safari 5.0.1 on OS X 10.6.4). Now I have reliable sample play back it's time to start playing around with more interesting interfaces in Processing and there are 26 hours of hacking left: game on!</p>

  [Procssing.js]: http://processingjs.org/
  [<span class="caps">HTML5</span> audio]: http://www.w3schools.com/html5/tag_audio.asp
  [didn’t get very far]: http://jimpurbrick.com/2010/06/07/html-5-multimedia/
  [@rem]: http://remysharp.com/
  [Music Hackday London]: http://london.musichackday.org/2010/
  [cc-sampling+]: http://creativecommons.org/licenses/sampling+/1.0/
  [vitriolix]: http://www.freesound.org/usersViewSingle.php?id=207
  [freesound.org]: http://www.freesound.org/
