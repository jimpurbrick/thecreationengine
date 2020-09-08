Title: HTTPS
Date: 2020-09-08 17:41
Slug: https

Before [my recent post about leaving
Facebook](https://jimpurbrick.com/2020/08/20/0-to-1/), it had been a
while since I’d updated [The Creation
Engine](https://jimpurbrick.com/) and it turned out I had some
housekeeping to do. After pushing the Pelican output to
[https://github.com/jimpurbrick/jimpurbrick.github.com](https://github.com/jimpurbrick/jimpurbrick.github.com)
I got a mail from GitHub saying that I needed to update the
jimpurbrick.com DNS records to point to a new set of IP addresses and
while doing that I noticed that GitHub now supports HTTPS for GH-Pages
hosted sites.

After the DNS changes had propagated I loaded up
[https://jimpurbrick.com](https://jimpurbrick.com) and saw that a lot
of the styling was broken. The issues tab in Chrome’s Inspector
revealed which resources were still being loaded over HTTP and it only
took a few minutes editing the [Pelican
](https://blog.getpelican.com/)configuration and some of the templates
to make the site use relative links and load externally hosted images
and CSS over HTTPS.

A few minutes after that the changes were pushed to GitHub and
[https://jimpurbrick.com](https://jimpurbrick.com) loaded without any
broken styling or HTTPS issues in Chrome inspector and with a
reassuring padlock in the address bar. While it’s unlikely that
serving a personal static blog over HTTP would have caused any
problems with
[eavesdroppers](https://en.wikipedia.org/wiki/Eavesdropping) or
[man-in-the-middle
attacks](https://en.wikipedia.org/wiki/Man-in-the-middle_attack), I’m
happy about being a good citizen and promoting safe and secure habits
on the web.