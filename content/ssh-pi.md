title: Detecting ssh login attempts on a raspberry pi
date: 2014-05-27 12:50:46
category: Blog
tags: hacking

# Introduction

I was looking for a project to learn how to use the GPIO on the
raspberry pi, and started with an adafruit tutorial on
[checking mail and turning on LEDs](https://learn.adafruit.com/raspberry-pi-e-mail-notifier-using-leds/overview). Since
I get too much email, I decided to change the application to check for
sucessful and failed ssh attempts on the rpi.

I learned some nifty things about processing files in python using
generators, or streams.

ssh logs successful and failed attempts to `/var/log/auth.log` on the
pi.

```{text}
$ grep sshd /var/log/auth.log
May  5 08:42:54 raspberrypi sshd[21479]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=humbertos-macbook.local  user=pi
May  5 08:42:56 raspberrypi sshd[21479]: Failed password for pi from 10.0.1.4 port 65157 ssh2
May  5 08:43:09 raspberrypi sshd[21479]: Failed password for pi from 10.0.1.4 port 65157 ssh2
May  5 08:43:33 raspberrypi sshd[21479]: Failed password for pi from 10.0.1.4 port 65157 ssh2
May  5 08:43:33 raspberrypi sshd[21479]: Connection closed by 10.0.1.4 [preauth]
May  5 08:43:33 raspberrypi sshd[21479]: PAM 2 more authentication failures; logname= uid=0 euid=0 tty=ssh ruser= rhost=humbertos-macbook.local  user=pi
May  5 08:44:10 raspberrypi sshd[21523]: Address 10.0.1.4 maps to humbertos-macbook.local, but this does not map back to the address - POSSIBLE BREAK-IN ATTEMPT!
May  5 08:44:17 raspberrypi sshd[21523]: Accepted password for pi from 10.0.1.4 port 65174 ssh2
May  5 08:44:17 raspberrypi sshd[21523]: pam_unix(sshd:session): session opened for user pi by (uid=0)
May  5 08:54:29 raspberrypi sshd[21568]: Received disconnect from 10.0.1.4: 11: disconnected by user
May  5 08:54:29 raspberrypi sshd[21523]: pam_unix(sshd:session): session closed for user pi
May  5 08:54:34 raspberrypi sshd[23682]: Accepted publickey for pi from 10.0.1.4 port 65320 ssh2
May  5 08:54:34 raspberrypi sshd[23682]: pam_unix(sshd:session): session opened for user pi by (uid=0)
May  5 08:54:48 raspberrypi sshd[24935]: Received signal 15; terminating.
May  5 08:54:48 raspberrypi sshd[23682]: pam_unix(sshd:session): session closed for user pi
May  5 08:55:07 raspberrypi sshd[2215]: Server listening on 0.0.0.0 port 22.
May  5 08:55:12 raspberrypi sshd[2215]: Received signal 15; terminating.
May  5 08:55:12 raspberrypi sshd[2292]: Server listening on 0.0.0.0 port 22.
May  5 08:56:16 raspberrypi sshd[2300]: Accepted publickey for pi from 10.0.1.4 port 65336 ssh2
May  5 08:56:16 raspberrypi sshd[2300]: pam_unix(sshd:session): session opened for user pi by (uid=0)
May  5 18:37:28 raspberrypi sshd[2300]: pam_unix(sshd:session): session closed for user pi
May  6 13:11:00 raspberrypi sshd[5331]: Accepted publickey for pi from 10.0.1.4 port 57060 ssh2
May  6 13:11:00 raspberrypi sshd[5331]: pam_unix(sshd:session): session opened for user pi by (uid=0)
```

It looks like no matter the method of authentication, we can just
check for sshd logs that say "Failed" or "Accepted".

# Methods

Following the tutorial on blinking leds, I constructed a circuit with
a red LED on pin 23 on the pi, and a green LED on pin 18.

We can set up code to initialize the leds to off, and to blink a
specified led.

```{python}
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GREEN_LED = 18
RED_LED = 23
GPIO.setup(GREEN_LED, GPIO.OUT)
GPIO.setup(RED_LED, GPIO.OUT)
GPIO.output(RED_LED, False)
GPIO.output(GREEN_LED, False)

def blink_led(led):
    GPIO.output(led, True)
    time.sleep(1.0)
    GPIO.output(led, False)
```

We're going to use [python generators](http://www.dabeaz.com/generators/Generators.pdf) to produce a /stream/, an infinite
list of sshd log entries from `/var/log/auth.log`. If these lines
match "Failed" we blink the red LED, if they match "Accepted", we
blink the green LED.

```{python}
def follow(thefile):
    thefile.seek(0,2) # Go to the end of the file
    while True:
        line = thefile.readline()
        if not line:
            time.sleep(0.1) # Sleep briefly
            continue
        yield line

if __name__ == "__main__":
    log = open("/var/log/auth.log")
    lines = follow(log)
    lines = (line for line in lines if "sshd" in line)

    for line in lines:
        if "Failed" in line:
            blink_led(RED_LED)

        if "Accepted" in line:
            blink_led(GREEN_LED)

GPIO.cleanup()
```

# Results

This program loops forever, waiting for ssh login attempts and
blinking the appropriate LED.

![rpi with ssh detection LEDs]({static}/images/pi-ssh-checker.jpg)

# Discussion

I like the program, and python generators are a lot cooler than I thought.

# References

1. <https://learn.adafruit.com/raspberry-pi-e-mail-notifier-using-leds/overview>

1. <http://www.dabeaz.com/generators/Generators.pdf>
