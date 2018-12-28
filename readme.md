## NodeLab  
NodeLab is a simple MATLAB-package for unstructured node-generation and refinement for meshfree modeling in arbitrary domains. The final output is two variables, which can be seen in the 'workspace'.
  * *xy* — an array containing interior nodes.
  * *bdy*— an array containing boundary nodes. 

## Installation
* Download the package on your PC. 
* Open MATLAB
* Go to the directory 'NodeLab'
* run the script 'setup.m'. This will add different directories of the NodeLab on your MATLAB path — only for the current session. Now you are ready to run the demos and generate nodes for your own project. 

## Tutorials
##### 1. test_1C 
* Generate uniform points inside a circle within a bounding box (-1,1)^2. 
```matlab
clear varibale; close all; clc
box    = [-1,-1; 1,1];
hbdy   = 0.02;
ptol   = 0.001;
[b]    = draw_circ(0,0,1,2/hbdy);
ctps   = [];
%ctps   = [linspace(-0.5, 0.5,10); zeros(1,10)]';        
radius = @(p,ctps) 0.05; % for fixed node-density
%radius = @(p,ctps) 0.005+0.08*(min(pdist2(ctps, p))); % for variable node-density
[xy]   = NodeLab2D(b.sdf,box,ctps,ptol, radius);
[bdy]  = b.xy;
clear box hbdy ptol ctps radius b
%-------------------------------------
plot(xy(:,1), xy(:,2),'.k','MarkerSize',12)
hold on
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize',12)
axis('square'); set(gca,'visible','off')
end
```
