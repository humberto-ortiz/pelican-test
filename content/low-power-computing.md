Title: Low-power computing
Slug: low-power-computing
Date: 2020-08-27 11:22:41
Category: Blog
Tags: hacking, learning

# Introduction

I sometimes direct the UPR [High Performance Computing
facility](https://www.hpcf.upr.edu/), or as my colleagues like to call
it, the medium performance computing facility. We've run largish
linux clusters and big sgi machines since the early naughts.

So it's a little surprising I'm also interested in low-power
computing. Until you hear some of our war stories, like the months we
couldn't run our 172-node linux cluster because our machine room would
heat up to 110 degrees Fahrenheit. Or the time the SGI technician came
to check one of our machines, and asked us if we flew our SGI on an
airplane, because the only system that had the same hardware issues
ours had was in a hurricane hunter airplane. (I think the alternate
rounds of heating and cooling popped a part loose on ours).

After Hurricane Maria, we spent several months without power, and we
used a variety of alternative energy sources. A small inverter hooked
up to a running car engine, an inverter with a 100W solar panel and
battery, a portable generator. These energy sources have continued to
be useful, the power in Puerto Rico hasn't been the most stable.

As I've used these sources, I've also looked at computing. A 13" or
15" laptop can draw 85-100 watts, about the same as an electric
fan. That would eat up the entire output of the solar panel at noon.

# kindleberrypi

The first setup I tried was a
[kindleberrypi](https://www.raspberrypi.org/blog/kindleberry-pi-the-second/).
Using a rooted kindle touch to ssh into a raspberry pi with an external keyboard
(mine is bluetooth). The kindle has a slow refresh rate, but it runs for days on
a charge, and only needs around 5 watts to charge over USB. The pi will sort of
run on 2 amps, but prefers 2.5 amps, so figure 12.5 W. I can actually run mine
for a couple of hours on a USB battery pack, or all day long on the solar panel.
I have a 12V accessory plug with alligator clips, so I don't need to run the
inverter. I can plug the pi into a car charger over USB.

The pi is a surprisingly nice computing platform. I can run emacs,
python, racket, lisp, even go. I sync files to my desktop and phone
with syncthing. Heck, I'm writing this blog post on a pi. There's even
a VNC client for the kindle, so I could, in theory run graphical
programs, although slowly. If I need to do compute intensive stuff, I
can ssh into the university, if the network and power cooperate (after
Maria even landlines and cable modems failed when the batteries ran
out).

# Android OTG

Working on the kindle is OK, but it's a little slow. Android phones and tablets
have a bit more oomph, and with termux, a linux environment is available. Termux
supports USB On-The-Go (OTG), so I bought a little micro USB OTG cable and can
plug a keyboard into a phone or tablet and run [termux](https://termux.com/).
This will actually make a nice front-end for a raspberry pi, and power is OK.
The only issue is with my cable I can't charge the phone or tablet while I'm
using it. A forced break every once in a while isn't much of a price to pay for
low power computing.

# Official Raspberry pi touchscreen

I likes the pi enough I decided to get another one. I got a rpi 4,
with a case and the official 7" touchscreen. The rpi4 comes with 2, 4,
or even 8 GB RAM, which is more than my personal laptop. It also wants
more power, moving to USB-C connectors, and the recommended power
supply is 3.5 A.

I bought a 3.1 A car USB-C charger, but it can't run the pi 4 off the solar
panel. I want to see if I can get another charger or run power to the screen and
the pi separately. I can run the pi off the inverter, but that's basically
converting 12V DC to 120 V AC, then back to 5V DC. I'd rather go straight 12V-5V
DC. I figure 15W can keep me running, and have power left over to charge the
battery. I hope I can continue to communicate and compute after the next storm.
Laura missed us, but there's already another wave coming off the coast of
Africa, and another in the MDR.
