title: PR-NETS Case Study: Next Generation Sequencing data
date: 2014-08-01
Slug: pr-nets-sequence-case-study
Category: research
tags: pr-nets

<div id="outline-container-sec-1" class="outline-2">
<h2 id="sec-1">Introduction</h2>
<div class="outline-text-2" id="text-1">
<p>
The <a href="http://ccom.uprrp.edu/~prnets/">PR-NETS</a> project is a NSF-funded activity to construct a <a href="https://fasterdata.es.net/science-dmz/">ScienceDMZ</a>
in the <a href="http://www.uprrp.edu/">UPR-RP</a> campus to expedite the transmission of science
data across and off-campus.
</p>

<p>
<a href="http://www.uprrp.edu/">UPR-RP</a> has a sequencing facility. Prior to the CC-NIE award,
Riccardo Papa contacted me to transfer 500 GB sequencing data from an
external drive to the <a href="http://www.hpcf.upr.edu/">HPCf</a>. 
</p>

<p>
He had tried several times without success to transfer the files from
his laboratory. I set up a scp transfer from a workstation in my lab,
but after some time the session timed out and the transfer failed. It
took 3 days and repeated restarts to complete the file transfer,
obtaining a maximum throughput of 127 Mbps, in March 2012.
</p>


<div class="figure">
<p><img src="{static}/images/hpcf-0312.png" alt="hpcf-0312.png" />
</p>
<p><span class="figure-number">Figure 1:</span> Total traffic to the HPCf in March 2012, showing a partial transfer of 500 GB sequencing data.</p>
</div>

<p>
In the CC-NIE proposal, we documented how we were able to transfer
files using <a href="https://www.globus.org/globus-connect">Globus Connect</a>, a specialized tool for bulk data
transfer. In February 2013, prior to the establishment of the
<a href="https://fasterdata.es.net/science-dmz/">ScienceDMZ</a>, the transfers using Globus Connect ran at a maximum rate of
132 Mbps.
</p>


<div class="figure">
<p><img src="{static}/images/hpcf-iotest-2-Interface_103-Traffic-Day.gif" alt="hpcf-iotest-2-Interface_103-Traffic-Day.gif" />
</p>
<p><span class="figure-number">Figure 2:</span> Total traffic to the HPCf February 4-5, 2013. This traffic includes tests of Globus Connect with a 50 GB test data set.</p>
</div>
</div>
</div>
<div id="outline-container-sec-2" class="outline-2">
<h2 id="sec-2">Methods</h2>
<div class="outline-text-2" id="text-2">
<p>
We were awarded the <a href="http://ccom.uprrp.edu/~prnets/">PR-NETS</a> grant to create a ScienceDMZ at UPR-RP. We
created a 10 Gbps Ethernet backbone within the campus using Cisco
switches. We purchased Intel 10 GE network cards (Intel Ethernet
Server Adapter X520-DA2) for several workstations in the Computer
Science department, including mine. My workstation is attached to a
Cisco Catalyst 4500-X over TwinAx cabling. The Catalyst has a fiber
optic connection to the ScienceDMZ switch router, a Cisco Catalyst
6506 in central IT. The ScienceDMZ is connected directly to the campus
router, and from there over a 1 GE link to the HPCf via AT&amp;T, rate
limited to 300 Mbps.
</p>

<p>
On August 1, 2014, I transferred 400 GB sequencing data and partial
sequence assembly results from UPR-RP to HPCf, and 159 GB
raw sequence data from the HPCf to UPR-RP. The transfers were
performed using Globus Connect.
</p>
</div>
</div>
<div id="outline-container-sec-3" class="outline-2">
<h2 id="sec-3">Results</h2>
<div class="outline-text-2" id="text-3">
<p>
The attached network utilization graphs show the sustained throughput
achieved with Globus Connect on the ScienceDMZ. Upload from campus to
the HPCf runs around 300 Mbps, transfers from HPCf to UPR-RP ran over
500 Mbps.
</p>


<div class="figure">
<p><img src="{static}/images/rrp-0801-Interface_55-Traffic-Day.gif" alt="rrp-0801-Interface_55-Traffic-Day.gif" />
</p>
<p><span class="figure-number">Figure 3:</span> Total campus traffic on August 1, 2014, showing bulk transfers with Globus Connect in both directions.</p>
</div>


<div class="figure">
<p><img src="{static}/images/hpcf-0801-Interface_103-Traffic-Day.gif" alt="hpcf-0801-Interface_103-Traffic-Day.gif" />
</p>
<p><span class="figure-number">Figure 4:</span> Total traffic at the HPCf on August 1, 2014.</p>
</div>

<p>
The download was interrupted by the expiration of the client
credentials for Globus Connect. The transfer resumed as soon as the
credentials were refreshed. The upload shows short interruptions as
well, and fluctuation in the data rate. Data transfer rates are also
measured by the Globus Connect application, Globus Connect reported an
average bandwith for transfers from HPCf to UPR-RP of 298 Mbps. The
reported average bandwidth for Globus Connect from UPR-RP to HPCf on
August 2 was 212 Mbps when total bandwidth to the campus was 300 Mbps.
</p>
</div>
</div>
<div id="outline-container-sec-4" class="outline-2">
<h2 id="sec-4">Discussion</h2>
<div class="outline-text-2" id="text-4">
<p>
The ScienceDMZ allows much higher throughput data transfers, with
fewer interruptions than the campus network. We are able to saturate
the WAN link to campus, where before we only obtained about a third of
the available bandwidth.
</p>

<p>
The ScienceDMZ and associated tools will allow researchers to move
large files on and off campus, permitting their participation in
data-intensive science projects. We look forward to collaborating with
other researchers with similar data transfer requirements.
</p>
</div>
</div>
<div id="outline-container-sec-5" class="outline-2">
<h2 id="sec-5">Acknowledgments</h2>
<div class="outline-text-2" id="text-5">
<p>
The <a href="http://ccom.uprrp.edu/~prnets/">PR-NETS</a> project is supported by NSF award 1340959 to Dr. Jose
Ortiz-Ubarri, Dr. Rafael Arce-Nazario and Dr. Humberto
Ortiz-Zuazaga. We would like to thank Dr. Riccardo Papa for loaning us
his data and motivating the case study.
</p>
</div>
</div>
