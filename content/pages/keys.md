Title: Keys
Slug: keys


I've had [PGP](http://www.openpgp.org/) keys since forever (well, OK,
at least 1994). My most recent keys were from 2001, and only had 1024
bit DSA keys.

I decided I need better key material, so I just put out a new set of
4096 bit RSA RSA keys. Following
[Apache best practices for key transition](http://www.apache.org/dev/key-transition.html),
I've signed my new key with my old key, and have pushed both out to
the keyservers. Any new correspondence should use the new key, with ID
A62B1791.

Here's the fingerprint for both keys:

```
$ gpg2 --fingerprint 3AB1F2F8 A62B1791
pub   1024D/3AB1F2F8 2001-06-07
      Key fingerprint = 4FB3 C7FA 510C 333D 624C  1482 3BC6 97F1 3AB1 F2F8
uid       [ultimate] Humberto Ortiz Zuazaga (Office) <humberto@hpcf.upr.edu>
sub   1024g/F4DE75AD 2001-06-07

pub   4096R/A62B1791 2015-06-18
      Key fingerprint = D854 8354 1E6C 38BB 4EB2  E12D F783 E341 A62B 1791
uid       [ultimate] Humberto Ortiz-Zuazaga <humberto@hpcf.upr.edu>
sub   4096R/B02D8496 2015-06-18
```

You can grab a copy of my keys from the
[keyservers](https://pgp.mit.edu/), or
[this file]({filename}/images/transition-keys.asc).

I also have Tor Messenger. The fingerprint for humberto.ortiz@upr.edu is:

```
3BB1FF26 DE596287 6AC62E5E 6E504C21 C6D50CDB
```
