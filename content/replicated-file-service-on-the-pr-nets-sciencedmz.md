Title: Replicated file service on the PR-NETS ScienceDMZ
Slug: replicated-file
Date: 2015-12-02
Category: Blog
Tags: hacking, PR-NETS
Author: Humberto Ortiz-Zuazaga
Status: draft

# Introduction

Many projects produce valuable digital data that should be
preserved. In the [PR-NETS](//prnets.ccom.uprrp.edu/) project we have
deployed a fault-tolerant distributed filesystem called
[Tahoe-LAFS](//tahoe-lafs.org/) to store project files.

The Tahoe-LAFS system consists of an introducer, a kind of directory
for storage servers, and multiple storage servers. The introducer and
storage servers all share a cryptographic secret that defines a
storage network.

A Tahoe-LAFS client is a node that does not provide storage service,
but it also connects to the introducer to obtain the list of storage
servers participating in the storage network.

A client can request to write or read files in the storage network
using cryptographic capabilities, special URLs that grant specific
capabilities in the storage network. For example, there are
capabilities to read, write, and verify files. Given a write
capability, the system can compute or derive lesser permissions like
the read or verify capability, but it is infeasible to compute a write
capability from a read capability. This feature allows secure sharing
of files within Tahoe-LAFS.

When a client wants to write a file to the storage network it encrypts
the file, divides it into shares using erasure coding, and uploads the
shares to the storage network. Erasure coding the files ensures that
the file can be reconstructed even if some of the shares are lost.

# Methods

## Configuration

In the PR-NETS ScienceDMZ we have six data transfer nodes (DTN)
designed to transfer files within campus, or to external
collaborators. These DTN have multiple 4 TB drives, and we reserved
one drive on each DTN for Tahoe-LAFS. One of the DTN runs both the
introducer and s storage server, the remaining 5 only run storage
servers.

In the PR-NETS system we have configured our system to use 2-of-6
encoding. Each file is split into 6 shares, and if any 2 shares can be
found, the entire file can be recovered. Thus, we can loose up to 4
disks or have multiple servers crash, and files can still be
recovered. This feature comes at the cost of tripling the space used
for storage of the files, for ensuring the apropriate level of
redundancy.  Each client can decide the encoding they wish to use, so
projects with different reliability requirements may use different
encoding.

## Tests

To test the Tahoe-LAFS system in PR-NETS, I uploaded a 658MB file to
Tahoe over wireless, downloaded the same file, and deleted a file
share from one of the servers to simulate a loss of data.

# Results

## Upload Results

Uploads take quite a while, the file has to be encrypted, erasure
coded, and distributed to 6 different servers.

    Shares Pushed: 6
    Shares Already Present: 0
    Sharemap:
        0 -> placed on [fbiwgrqp]
        1 -> placed on [gvgjk3pe]
        2 -> placed on [iqy2qfob]
        3 -> placed on [ha4tvtv4]
        4 -> placed on [cg755rzp]
        5 -> placed on [p2tovncz]
    Servermap:
        [p2tovncz] got share: #5
        [iqy2qfob] got share: #2
        [fbiwgrqp] got share: #0
        [ha4tvtv4] got share: #3
        [cg755rzp] got share: #4
        [gvgjk3pe] got share: #1
    Timings:
        File Size: 689559552 bytes
        Total: 38 minutes (296.7kBps)
            Storage Index: 8.87s (77.77MBps)
            [Contacting Helper]:
            [Upload Ciphertext To Helper]: ()
            Peer Selection: 185ms
            Encode And Push: 38 minutes (299.2kBps)
                Cumulative Encoding: 38 seconds (17.99MBps)
                Cumulative Pushing: 37 minutes (304.3kBps)
                Send Hashes And Close: 9.29s

## Download Results

Downloads are much faster, as the tahoe client can pull shares from
multiple servers.

    $ time tahoe cp tahoe:data/GNUSTEP-i686-2.0.iso .
    Success: files copied
    
    real    6m15.390s
    user    0m1.164s
    sys     0m1.100s

That turns out to be 1.7 MB/sec.

## Repairing the file.

After deleting one of the shares, tahoe is unhappy. Running a repair operation is expensive, as tahoe downloads shares, computes the missing share, and reuploads the file.

# Discussion

# References

[1] Zooko Wilcox-O'Hearn and Brian Warner. 2008. Tahoe: the
least-authority filesystem. In Proceedings of the 4th ACM
international workshop on Storage security and survivability
(StorageSS '08). ACM, New York, NY, USA,
21-26. DOI=<http://dx.doi.org/10.1145/1456469.1456474>
