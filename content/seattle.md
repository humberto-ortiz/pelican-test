title: Seattle distributed computing
date: 2013-12-26
category: Blog
tags: hacking

## Abstract

The Seattle distributed system is a framework for running python
programs across many computers on the Internet.

## Introduction

I've been interested in <a href="http://www.hpcf.upr.edu/~humberto/documents/penguin-safe-scripting.html">distributed scripting</a> since I was a graduate
student in <a href="http://www.utsa.edu/">The University of Texas at San Antonio</a>. I was pleasantly
surprised to see that there is a new python implementation of
distributed scripting.

<a href="https://seattle.poly.edu/">Seattle</a> is geared towards creation of distributed network programs,
but uses a restricted python interpreter, you can write arbitrary
programs as well.

## Implementation

I haven't seen the source of entire system, but there are three main
components. Users run a <a href="https://seattleclearinghouse.poly.edu/download/flibble/">seattle server</a> and donate compute resources to
the Seattle community. The <a href="https://seattleclearinghouse.poly.edu/">Seattle clearinghouse</a> arbitrates access to
the donated resources, and manages reservations on one or more nodes
(called "vessels" in Seattle). The devkit (available for download on
your clearinghouse profile page) provides tools to develop
Seattle programs and run on the vessels reserved for you.

Users are identified by public/private keypairs, and have access to a
restricted subset of python called <a href="https://seattle.poly.edu/wiki/PythonVsRepy">Repy</a>. Several example programs are
included in the devkit, and <a href="https://seattle.poly.edu/wiki/EducatorsPage#SecurityOperatingSystemsAssignments">more</a> are available on the Seattle website.

Repy limits the features available to programmers, but you can develop
a program in another language and call repy to perform distributed
computing, or use Repy or <a href="https://seattle.poly.edu/wiki/SeattleLib">SeattleLib</a> features to implement your
program. Developer specific information is available <a href="https://seattle.poly.edu/wiki/ProgrammersPage">online</a>.
