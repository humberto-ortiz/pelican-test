Title: diffhash: find differentially expressed kmers
Slug: diffhash-find-differentially-expressed-kmers
Date: 2018-12-12 10:39:18
Category: Research
Tags: hacking, learning

I've been wanting to learn [julia](https://julialang.org) for a while,
and with the recent release of version 1.0 I figured now's a good
time. I worked some of the tutorial, and figured I could start writing
real programs, so I took a stab at a program I've been mulling about
for a while.

I do gene expression analysis on organisms that lack a reference
genome, and the process is rather cumbersome.

1. build a reference transcriptome by pooling RNASeq runs and doing
de-novo assembly.

1. quantify reads with resepect to the reference transcriptome (by
aligning or using newer non-alignment methods)

1. do differential gene expression analysis.

There are a few problems with this approach, the assembly is hard, and
you won't care about a lot of the fragments. What if you could find
"interesting" parts of the input sequences before building the
reference transcriptome? Would that simplify the assembly and
detection of differential expression?

I normaly try out ideas like this in python, but wanted to see if
julia could work. I've put some code up on github, in the
[diffhash](https://github.com/humberto-ortiz/diffhash) repository. I
use R to do the statistical tests, but the code to count kmers is in
julia. Writing in julia is nice, and the BioSequences module and the
JLD module make reading sequence files and saving data to disk simple.

The code runs 106 MB worth of reads in 20 files in just under 8
minutes on a i7 laptop with an SSD.

```
$ rm hashcounts.tsv 
$ time if [ ! -f hashcounts.tsv ]; then   julia diffhash.jl > /dev/null;   julia showhash.jl > hashcounts.tsv; fi

real	7m54.106s
user	6m54.640s
sys	0m52.350s
$ du -sh simulated_reads/
106M	simulated_reads/
```

That reads 20 files into a hash table, counts the kmers, and writes it
out to an HDF file. The second program reads the HDF and writes out a
tab separated file for R.

The repository has a README.md and the R code is documented in diffhash.Rmd.
