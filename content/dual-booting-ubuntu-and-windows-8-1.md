Title: Dual-booting Ubuntu and Windows 8.1
Slug: dual-booting-ubuntu-and-windows-8-1
Date: 2015-01-07 11:28:39
Category: Blog
Tags: hacking, learning

## Introduction

After a long hiatus running Mac OS X, I decided to return to linux on
my main PC. My MacBook is showing signs of dying, and a hard drive
crash during a backup made me finally decide to get a new machine.

I got a [HP Pavilion 13-A010dx X360](http://store.hp.com/webapp/wcs/stores/servlet/us/en/pdp/Laptops/hp-pavilion-13-a010dx-x360-convertible-pc), one of those new-fangled
convertible laptop/tablet hybrid things. It's got decent specs: a Core
i3 processor with hyperthreading, 4GB RAM, 500 GB HDD. I think there's
an Core i5 model available too.

I do most of my work on linux, but wanted to keep Windows 8.1 for some
things that require WIndows, so I looked around for ways to dual-boot.

## Dual-boot guides

I was actually pretty lucky, and found a
[dual-boot guide](http://www.everydaylinuxuser.com/2014/05/install-ubuntu-1404-alongside-windows.html),
but it seemed a bit complicated, so I just winged it, and nothing
broke. A lot of guides start with making an EFI bootable USB, but my
stock ubuntu 14.04.1 image just worked, no modifications required.

It took me a long time to figure out how boot linux off my USB drive,
trying to press each of the F-keys (which require pressing fn at the
same time) to get a boot menu. I think pressing esc finally worked,
but I've since learned it's really easy to boot ubuntu 14.04.1 off of
USB, in Windows, just hold the shift key while selecting "Restart" to
boot into an EFI menu.

I was really stupid, and resized my Windows partition in linux,
breaking a rule I learned a long time ago: use each OS's tools to
manipulate it's own objects. When I rebooted into Windows it still
thought the entire disk was his. Checking the disk for errors and
repairing it worked, but that's risky. It's much better to use the
Windows Drive Management tool to shrink the partition, then use linux
to install into the free space.

Here's a
[clearer dual-boot guide](http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/). I
followed this one to set up my son's
[Acer R14](http://us.acer.com/ac/en/US/content/series/aspirer14). The
Acer required
[disabling secure boot](http://itsfoss.com/disable-secure-boot-in-acer/)
before it boots linux off the HDD, but the HP did not require any
changes to the EFI.

## Hardware support

As far as I can tell, almost everything works on the HP. The touchpad
makes the cursor jump around while you type, but I found a good guide
on setting up
[palm detection](http://stevenkohlmeyer.com/fixing-palm-detect-ubuntu-14-04/)
that fixes it.

Bluetooth sometimes works and sometimes doesn't (mostly doesn't). The
machine has a Broadcom 20702 bluetooth chip. It works after
cold-booting into Windows, and worked once in linux, but most of the
time, I can't see the device in linux.
