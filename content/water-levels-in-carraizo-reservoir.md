Title: Water levels in Carraizo reservoir
Slug: water-levels-in-carraizo-reservoir
Date: 2019-04-26 14:21:50
Category: Blog
Tags: hacking, learning

# Introduction

During the 2015 drought I wrote
[niveles-carraizo]({filename}/water-level-at-carraizo-reservoir.md),
an openshift app to monitor the water levels at the reservoir close to
my home. Openshift changed the way apps work, so the app stopped
working a while back.

The app used a cronjob to scrape data from our water works, but the
USGS has a [public repository](https://waterdata.usgs.gov) with
historical and current data. For example, the daily data for the
draught year is
<https://nwis.waterdata.usgs.gov/nwis/uv?cb_62614=on&format=gif_default&site_no=50059000&period=&begin_date=2015-01-01&end_date=2015-12-31>.

The app also used python and pygal to render graphs on the server side.

# Methods

I reimplemented the Carraizo application in pure javascript, using the
USGS data, and the D3.js and Plotly.js libraries. The javascript
queries the USGS site from the browser and renders the plot seen below.

The new app only needs the USGS data and a static server.

# Results

<script src='{filename}/scripts/d3.min.js'></script>
<!-- Plotly.js -->
<script src="{filename}/scripts/plotly-latest.min.js"></script>
<script src='{filename}/scripts/analysis.js'></script>

<!-- Plotly chart will be drawn inside this DIV -->
<div id="myDiv"></div>

# References

  - USGS Waterdata <https://waterdata.usgs.gov>

  - D3.js <https://d3js.org/>

  - Plotly.js <https://plot.ly/javascript/>
