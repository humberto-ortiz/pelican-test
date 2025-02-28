title: Setting up ocaml on an arm64 machine
date: 2025-02-28
category: Teaching
tags: hacking, learning
slug: teaching/compilers2025/apple-silicon

The text asumes we're running on 
a x86_64 linux virtual machine:

```{bash}
$ uname -ms
Linux x86_64
```

If you're running on a Mac with Apple Silicon (M1/M2/...) we'll need to set up a cross compiler.

Use UTM to install am arm64 linux virtual machine, like Ubuntu Jammy Jellyfish (22.04).

Install ocaml, and the opam package manager as described in [the setup instructions]({filename}setup.md)

In addition to the regular gcc compiler, install a cross compiler that can generate x86_64 machine language:
```{bash}
$ sudo apt-get install --yes gcc-x86-64-linux-gnu
```

Edit your Makefiles to use the cross compiler when building .run files:

```{make}
PLATFORM=$(shell uname -m)

ifeq ($(PLATFORM),x86_64)
CC=gcc
else
CC=x86_64-linux-gnu-gcc -static
endif

%.run: %.o
        $(CC) -g -m64 -o $@ main.c $<

%.o: %.s
        nasm -f elf64 -o $@ $<

%.s: %.int
        dune exec ./compiler.exe $< > $@
```

To test your programs, you will need to install qemu-user:

```
$ sudo apt install qemu-user
$ qemu-x86_64 ./cero.run
0
```
