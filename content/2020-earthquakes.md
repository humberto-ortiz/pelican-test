Title: 2020 Earthquakes
Slug: 2020-earthquakes
Date: 2020-01-14 13:54:32
Category: Blog
Tags: hacking, learning

# Introduction

Puerto Rico had a swarm (or *sequence*) of earthquakes at the end of
2019 and the start of 2020. So far, the largest was a
[magnitude 6.4 on January 7, 2020](https://www.usgs.gov/news/magnitude-64-earthquake-puerto-rico).

Since around December 28, there have been hundreds of quakes in the
region. Several researchers have made plots of the activity, posting
on twitter, facebook and other social media. [Rafael Arce](http://ccom.uprrp.edu/~rarce/ditto/) posted a
Google Colaboratory notebook with code to plot the earthquake
intensities vs time. I've modified the code and made a few plots.

# Methods

This [Google Colab notebook](https://colab.research.google.com/drive/1pkqqWc_MhuDbDP7OpVE33JU4BKTfQGbL) hosts python code to query the USGS site
and plot magnitude vs time.

I'm using a similar technique to Rolando J. Acosta, who posted
[this figure](https://twitter.com/RJANunez/status/1216400930624737280)
in his twitter feed. His [R code is available on github](https://github.com/RJNunez/twitter-vizs).

# Results

![Plot of magnitude vs time for the southwest Puerto Rico region]({static}/images/temblores.png)
