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
Meshless/meshfree methods are cutting-edge numerical methods for numerical modeling, which, unlike other mesh-based algorithms, do not require a structured grid or elements in the domain. These methods can work with scattered nodes in the domain; however, the nature of the modeling problem often suggests a certain type of node layout to get the most efficient modeling results. Many real-world applications (like weather forecasting, tsunami modeling, geophysical imaging, and computational mechanics) require generating many nodes in a significantly large arbitrary domain. The literature in this context is up-and-coming, which focus on different aspects of node-generation based on typical requirements. The node-placing approach by @Fornberg:2015 is similar to advancing front methods and has been reported to have advantages like computational speed, simple algorithms, and good quality of distribution. 

NodeLab is a simple MATLAB repository for node generation and adaptive refinement for testing, and implementing various meshfree methods for solving PDEs in arbitrary 2D domains. The core algorithm behind this package is the node-placing approach [@Fornberg:2015] because of its simplicity, computational speed, and the quality of the distribution. The node-placing method has been used for creating initial node-distribution in the bounding box of the desired domain. A crucial decision in this context is how to represent the geometry of the domain. We compute the signed-distance field (SDF) for the domain geometry based on a priori information about the domain, which is often used in mesh generation for finite element methods [@Persson:2004]. This a priori information could be the geometry created using simple shapes, given as a function $D(x, y) = 0$, or some discrete set of seed nodes---later providing the flexibility to create the domain by manually digitizing the geometry. Refinement of the boundary nodes is done by formulating the problem in terms of differential equations that describe the path along the curve and interpolating through an ODE solver. The node distribution in ``NodeLab`` can be refined non-uniformly by adapting the information provided through *control-points*, which are an input from the user. *control-points* provide spatial locations where the user needs relatively finer nodes. 

Future developments in this package may include its extension to 3D and surfaces, an optional graphical user interface, and improvements to adaptivity by using machine learning algorithms to decide the *control-points*. ``NodeLab`` is intended to be an open-source and collaborative project, where developers and users could contribute to make (and keep) it state-of-the-art by incorporating the improvements as the research in this field grows with time.
 
# References
