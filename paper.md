---
title: 'NodeLab: A MATLAB package for meshfree node-generation and adaptive refinement'
tags:
  - MATLAB
  - RBF
  - Scientific Computing
  - Numerical Modeling
  - Meshfree Methods
  - Meshless Methods
authors:
  - name: Pankaj K Mishra
    orcid: 0000-0003-4907-4724
    affiliation: 1
affiliations:
 - name: Department of Mathematics, Hong Kong Baptist University
   index: 1
date: 2 January 2019
bibliography: paper.bib
---

# Summary
Meshless or meshfree methods, which work globally or locally are up-and-coming numerical methods for numerical modeling, which unlike other mesh-based algorithms, do not require an structured grid/elements in the domain. These methods can work with scattered nodes in the domain, however, the nature of the modeling problem often suggests a certain type of node-layout to get the most efficient modeling results.

``NodeLab`` is a simple MATLAB-repository for node-generation and adaptive refinement for testing, and implementing various meshfree methods for solving PDEs in arbitrary domains. The core-algorithm behind this package is the *node-placing* [@Fornberg:2015] approach because of its simplicity, computational speed and the quality of the distribution. The *node-placing* method has been used for creating initial node-distribution in the \emph{bounding-box} of the desired domain. To represent the geometry of the domain, NodeLab couples the Signed-distance function (SDF) [@Persson:2004], which can be computed based on *a priory* information about the domain. As a result, NodeLab can take the following geometric objects as inputs: 

* simple shapes (like rectangles, and circles), required to create the desired geometry. For example, the SDF for a typical *plate with a hole* can be computed through a rectangle and a circle. 
* a level-set representation $D(x,y)=0$ of the domain, or 
* some discrete sets of point clouds on the boundary, which need not be uniformly
sampled. NodeLab uses curve-interpolation to redisctribute the input point-cloud as per user-defined density, which provides the flexibility to create the domain by manually digitizing of the geometry from any image.

The node-distribution in ``NodeLab`` can be  refined non-uniformly by adapting the information provided through *control-points*, which are an input from the user. *control-points* provide spatial locations where the user needs relatively finer nodes. 

Future developments in this package may include its extension to 3D, and surfaces, an optional graphical user interface, improvement in the adaptivity by using Machine Learning algorithms to decide the *control-points*,  etc. ``NodeLab`` is intended to be an open-source and collaborative project, where developers and users could contribute to make (and keep) it -state-of-the-art by incorporating the improvements as the research in this field grows with time.
 
# References
