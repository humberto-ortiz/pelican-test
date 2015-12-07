Title: Replicated file service on the PR-NETS ScienceDMZ
Slug: replicated-files
Date: 2015-12-06
Category: Blog
Tags: hacking, PR-NETS
Author: Humberto Ortiz-Zuazaga

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

    $ time ./src/allmydata-tahoe-1.9.2/bin/tahoe cp /home/humberto/Downloads/CentOS-7-x86_64-DVD-1503-01.iso tahoe:data/
    Success: files copied
    
    real    1m39.318s
    user    0m1.390s
    sys     0m1.226s
    
    $ ls -lh /home/humberto/Downloads/CentOS-7-x86_64-DVD-1503-01.iso
    -rw-rw-r-- 1 humberto humberto 289M Apr 16  2015 /home/humberto/Downloads/CentOS-7-x86_64-DVD-1503-01.iso

Thats 1:39 for 289 MB, or 2.9 MB/sec upload.

## Download Results

Downloads can be faster, as the tahoe client can pull shares from
multiple servers.

    $ time ./src/allmydata-tahoe-1.9.2/bin/tahoe cp tahoe:data/CentOS-7-x86_64-DVD-1503-01.iso foo.iso                                             Success: file copied
    
    real    1m34.796s
    user    0m1.113s
    sys     0m1.383s

That turns out to a bit slower,  2.8 MB/sec.

## Repairing the file.

After deleting one of the shares, tahoe is unhappy. Running a repair
operation is expensive, as tahoe downloads shares, computes the
missing share, and reuploads the file.

    $ time ./src/allmydata-tahoe-1.9.2/bin/tahoe check tahoe:data/CentOS-7-x86_64-DVD-1503-01.iso 
    Summary: Healthy
     storage index: hgl2j6fohszkolt676xmieoi2y
     good-shares: 6 (encoding is 2-of-6)
     wrong-shares: 0
    
    real    0m1.003s
    user    0m0.669s
    sys     0m0.118s

    $ time ./src/allmydata-tahoe-1.9.2/bin/tahoe check --repair tahoe:data/CentOS-7-x86_64-DVD-1503-01.iso 
    Summary: not healthy
     storage index: hgl2j6fohszkolt676xmieoi2y
     good-shares: 5 (encoding is 2-of-6)
     wrong-shares: 0
     repair successful
    
    real    2m21.822s
    user    0m0.673s
    sys     0m0.119s

# Discussion

Tahoe-LAFS is an intersting filesystem. Although it is not high
performance, it can be configured to high levels of reliability, and
is very secure. It can be configured so that even malicious server
operators cannot obtain the contents of your files, and can resist
even a majority of file servers being unavailable.

If you are interested in using Tahoe-LAFS for your project, contact
Humberto Ortiz-Zuazaga <humberto.ortiz@upr.edu>.

# References

[1] Zooko Wilcox-O'Hearn and Brian Warner. 2008. Tahoe: the
least-authority filesystem. In Proceedings of the 4th ACM
international workshop on Storage security and survivability
(StorageSS '08). ACM, New York, NY, USA,
21-26. DOI=<http://dx.doi.org/10.1145/1456469.1456474>
