Title: Binder: a service for live jupyter notebooks
Slug: binder-a-service-for-live-jupyter-notebooks
Date: 2016-08-21 20:28:03
Category: Blog
Tags: hacking, learning

[C. TItus Brown](http://ivory.idyll.org/) showed us this really cool
service called binder in the
[mRNAseq data analysis workshop](http://idi-bd2k.hpcf.upr.edu/2016/08/15/workshop-mrnaseq-on-non-model-organisms/)
on Saturday.

If you go to

<http://mybinder.org/>

and paste in a github repository like

<https://github.com/humberto-ortiz/ama>

that contains some data and some [jupyter](http://jupyter.org/)
notebooks, binder will redirect you to a page like

<http://mybinder.org/status/humberto-ortiz/ama>

where it builds a docker image from the github repository. From this
page you can launch the docker image on Google Container Engine, and
get a link that launches the container.

<http://mybinder.org/repo/humberto-ortiz/ama>

or a markdown badge like  [![Binder](http://mybinder.org/badge.svg)](http://mybinder.org:/repo/humberto-ortiz/ama)

(check it out, if the service is running, that link is live, and gives
you your own machine in Google's data center).

You can share that to your students, and if the student clicks on it,
he gets his own copy of the notebook that he can edit, recalculate,
generate plots, print. The jupyter notebook also supports an in-browser
terminal and general file editor.

Titus has been using it for data science workshops. It's great because
you don't need to install anything on the workshop machines except a
web browser. and if you need to setup additional software on the
server side, you can include a Dockerfile in the github repository.

When it works, binder is awesome. Here are a few example repositories:

One that includes [julia](http://julialang.org/) (jupyter defaults to
python, but supports
[over 40 languages](https://github.com/ipython/ipython/wiki/IPython-kernels-for-other-languages))

<https://github.com/binder-project/example-dockerfile>

Titus's repo that installs R and links R to jupyter

<https://github.com/ctb/2016-mybinder-irkernel>

LIGO Gravitational Wave tutorial

<https://github.com/minrk/ligo-binder>
