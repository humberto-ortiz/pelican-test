Title: First steps in Plan 9
Slug: first-steps-in-plan-9
Date: 2020-09-23 14:15:03
Category: Blog
Tags: hacking, learning

While learning about Mastodon and the fediverse (more on that later, in a
separate post), I ran across a [group of
people](https://mastodon.online/web/timelines/tag/plan9) learning and working
with [Plan 9](https://9p.io/plan9/). Plan 9 is an operating system developed at
Bell Labs in the 1990's, a sort of successor to some of the ideas in research
UNIX.

I'd heard about it before, but never tested it out. This time around, though, I
found out there's images that run on Raspberry pi's. I'm using a 32-bit image
called [9pi.img](https://9p.io/sources/contrib/miller/9pi.img.gz), there's also
a 64-bit version available from 9front, but it doesn't have working drivers for
WiFi. There are several Plan 9 versions like 9front, Inferno, ANTS, each with
their own community and differing program sets, sort of like different linux
distributions. I'm going to stick to Miller's 9pi.img in most of my discussion.
I've got it running on a Raspberry pi 3B+. It has great performance, and is well
supported. This rpi can actually run the 64-bit version also, as can the rpi 4.

I used Balena Etcher to burn the 9pi.img file to a 8GB microSD card. When you
boot, the machine will come up in text mode to ask you where to boot from, and
the username. You can press enter to select the defaults, the default user is
"glenda".

Wired networking would come up automatically, but to get wireless, you need some
setup. First is to modify `cmdline.txt` to load the WiFi drivers. See the
example config file `cmdline-wifi.txt`, or add the parameter `ether1=type=4330`
to the existing command line. You can mount the boot partition from plan9 using
the `c:` command. The boot partition will be mounted on `/n/c`. The editors are
`acme` or `sam`. Tutorials are available on cat-v:
[acme](http://acme.cat-v.org/), 
[sam](http://sam.cat-v.org/).

After booting, you still need to set up WiFi. I use a short rc script:
```
#!/bin/rc

bind -a '#l1' /net
echo essid YOUR_SSID_HERE >/net/ether1/clone
ip/ipconfig ether /net/ether1
ndb/dns -r
```
You can get a primitive web browser by running
```
touch $home/lib/webcookies
webfs
abaco
```
