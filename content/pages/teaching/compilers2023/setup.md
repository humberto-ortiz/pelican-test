title: Setting up ocaml on a new Ubuntu 22.04 virtual machine
date: 2023-01-29
category: Teaching
tags: hacking, learning
slug: teaching/compilers2023/setup

I'm using a x86_64 linux virtual machine:

```{bash}
$ uname -ms
Linux x86_64
```

I'm using Ubuntu Jammy Jellyfish (22.04), which has long term support for at
least 5 years.

I'll install ocaml, and the opam package manager, which we can use to manage our
ocaml environment. I also install build-essential to get make, gcc, and other
tools for compiling.

```{bash}
$ sudo apt-get install --yes build-essential opam ocaml
```

Now we can setup opam:

```{bash}
$ opam init --yes --shell-setup
$ eval $(opam env --switch=default)
```

Because I'm a [troglodyte]({filename}/pages/troglodita.md), I'll be using emacs
a lot, so I'll install emacs and setup ocaml support for emacs. You don't have
to use emacs (it's a pain to learn), but you should look into how to setup your
own editor to work with ocaml source code.

```{bash}
$ sudo apt-get install --yes emacs-nox
$ opam --yes user-setup install
```

Opam will set up multiple editors if it can find them in your path. In my case
it setup both emacs and vi.

In class I'll be doing a lot of testing and live-coding. Plain ocaml is kind of
spare, so I'll install utop, which is a tool for writing ocaml code at the
command line:

```{bash}
$ opam --yes install utop
```

Later on, we'll be installing more tools with opam.
