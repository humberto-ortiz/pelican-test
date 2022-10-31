title: Fixing our VM
date: 2022-10-17
category: Teaching
tags: hacking, learning
slug: teaching/cyber2-2022/fixing

## Description

The MIT VM we use in class is based on Ubuntu 21.10 Impish Indri. It was
supported until Fall 2022 (9 months), see [Ubuntu release
cycles](https://ubuntu.com/about/release-cycle).

We need to upgrade our VM, but we can't until we update it. Updating it gives
errors because it is unsupported. We'll use some tricks to break the cycle.

First, we'll point the upgrade at a special repository:

```bash
sudo sed -i -re 's/mirrors.mit.edu/old-releases.ubuntu.com/g' /etc/apt/sources.list
```

Now update and upgrade:

```bash
sudo apt-get update
sudo apt-get --yes --ignore-hold --allow-change-held-packages dist-upgrade
```

Answer "OK" to both prompts.

Now we can reboot into a clean image:

```bash
sudo reboot
```

Connect to your VM again, and upgrade the operating system.

```bash
sudo do-relase-upgrade
```

When it asks about the ssh configuration, select
```
 │       keep the local version currently ...          │
```

Answer 'y' to all the other prompts. This process takes a long while. At the
end, you need to reboot again to boot into the upgraded VM.

Connect to the VM again. Now we can update the base images for the containers:

```bash
cd /usr/local/6858/lxcbase/
sudo sed -i -re 's/impish/jammy/g' download.sh
sudo ./download.sh
```

Now the lab2 should work.
