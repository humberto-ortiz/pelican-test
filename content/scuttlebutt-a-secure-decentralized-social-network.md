Title: Scuttlebutt: a secure decentralized social network
Slug: scuttlebutt-a-secure-decentralized-social-network
Date: 2017-04-28 09:02:01
Category: Blog
Tags: hacking

# Scuttlebutt

I've been playing with scuttlebutt, a secure decentralized social
network for a few days, and wanted to share some information on it.

Scuttlebutt isn´t so much a program as an *ecosystem*, a collection of
programs, protocols, servers and people that allow users to share
information peer-to-peer.

# Patchwork

The simplest way to get started with scuttlebutt is to install
[patchwork](https://github.com/ssbc/patchwork), a graphical client
that connects to the scuttlebutt network and displays posts.

If you run patchwork, you will have a node running scuttlebutt, and if
anyone in your local network is also running a node, you will see
their public posts. However, if no one on your local network is
running a node, you won't see anythng.

# Identities

When you start up patchwork, it creates an identity for you. An
identitiy in scuttlebutt is a key pair. You broadcast your public key
to all interested parties. For example, I am known as
@RtsOc2h1gqh0fRrjrUTHAkRBu9YyDgsD+EWsfLpykrc=.ed25519

Each identity has an associated feed, and the secret key allows you
(and only you) to post to your identity's feed. The feed is a
blockchain, meaning you can only append to your feed, not edit or
delete anything you post.

# Pubs

In order to see anyone else's posts, you need to be able to find their
feeds. Right now, the simplest way to see feeds is by connecting to a
*Pub*, or public server. These are regular ssb nodes that have fixed IP
addresses, and run software to generate invitations into the network.

There are
[lists of known Pubs](https://github.com/ssbc/scuttlebot/wiki/Pub-Servers),
and I'm running a Pub on
[our server](http://hulk.ccom.uprrp.edu/). Visit a Pub, ask for an
invite, and you can paste the invite into the patchwork client to
connect your node to that pub and see the public posts of the visitors
to that Pub. Click on the "+ Join Pub" button in patchwork to connect,
and paste in your invitation code.

# Posts, votes, and channels

Once you are set up, you can write a post. Posts can be as long as you
want (not limited to 140 characters), and can use Markdown formatting.

Your client will sign your post with your secret key, and append it to
your feed. The post will then be propagated to any of your followers
(at first, only the pubs you joined).

A special form of message, a "vote", can link to another post, and
express approval (or disaproval). Patchwork uses these vote messages
to implement likes.

If you want to join a broader conversation, you can post into a
`#channel`. A channel is a topic linked by a # sign. You can browse
lists of recent channels, search for channels, and subscribe to
channels, which will then make your node pull posts from other users
that post to the channels.

# Private posts

Since everyone in scuttlebutt has a keypair, and everyone broadcasts
their public key, you can send messages encrypted directly to each
recipient. No central service knows your secret key, and the way
private messages are implemented now, you append your encrypted
message to your feed, so no one can even know who the recipient of the
private message is. (Your friends will pull your post from your feed
and figure out if it is for them).

# Other clients

There are more clients available for scuttlebutt. I like
[patchfoo](https://git.scuttlebot.io/%25YAg1hicat%2B2GELjE2QJzDwlAWcx0ML%2B1sXEdsWwvdt8%3D.sha256),
because it is very lightweight, and I'm a
[troglodite]({filename}/pages/troglodita.md). It runs a server on your
own computer and you connect to it with your usual browser. The default
server binds to the IPv6 localhost address ::1. At least in my version
of firefox, you need to include that IPv6 address in square brackets
to connect <http://[::1]:8027/>

# git-ssb

The patchfoo git repository lives in
[git-ssb](https://git.scuttlebot.io/%25n92DiQh7ietE%2BR%2BX%2FI403LQoyf2DtR3WQfCkDKlheQU%3D.sha256),
which is a plugin for git that uses the scuttlebutt network for the
backend. It supports file storage, pull requests and issues in a
completely distributed fashion, **with no central server**. Each ssb
node replicates the files for the repositories it's interested in, and
shares them to other peers.
