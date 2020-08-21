Title: Covid-19 and the Random Student Generator
Slug: covid-19
Date: 2020-08-21 09:23:09
Category: Blog
Tags: learning

It's been a few months since I wrote anything in the blog. Like everyone, I've
been busy with the Covid-19 pandemic. We moved all classes online in March, and
Fall 2020 is online only too. Teaching online is hard, maybe as hard as learning
online. I'm grateful to the Carpentries, they have some suggestions for online
teaching [in their
guide](https://carpentries.org/online-workshop-recommendations/).

I'll share one tidbit that's helped me: the Random Student Generator. Students
hate it, but I like it because it keeps students active in class, and keeps
those students that always answer from taking up all class time. I run it with a
list of student names and it gives me one student at random, or run it with an
argument n and it pulls n student names without replacement.

```{bash}
#!/bin/sh
# Random Student Generator
# Copyright 2017-2020 - Humberto Ortiz-Zuazaga - humberto.ortiz@upr.edu
# Released under the GNU General Public License version 3 or later

# Read in a file named as an arugment 
# (student names, one per line)
# pick a random line
# with argument -n x, pull x students names

STUDENTS=1

while getopts 'n:' c
do
    case $c in
	n) STUDENTS=$OPTARG ;;
    esac
done

shift $((OPTIND-1))

cat "$1" | shuf -n $STUDENTS 

```

One of these days I'll turn it into a web app.

I hope infection rates continue to fall and we can consider reopening campus.
Rafa Irizarry is publishing great plots on rates of positivity,
hospitalizations, and more at <http://tpr.covidpr.info>.
