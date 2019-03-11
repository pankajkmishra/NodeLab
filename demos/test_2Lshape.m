%% test_2LShape.m 
% This test generates non-uniform nodes in a L-shaped domain within 
% a bounding box (-1,1)^2. The node-density is highest at the 
% reentrant corner [0,0]. 

clear variables; close all; clc
%----------------------------------------------------
box    = [-1, -1; 1, 1 ];
hbdy   = 0.025;
ptol   = 0.001;
[b]    = make_domain('Lshape.txt'); 
ctps   = [0, 0];
radius = @(p,ctps) 0.005+0.05*(min(pdist2(ctps, p)));
[xy]   = NodeLab2D(b.sdf,box,ctps,ptol,radius);
bdy    = bsmooth(b.xy, hbdy);
clear b box hbdy ctps radius ptol 
%----------------------------------------------------- 
plot(xy(:,1), xy(:,2),'.k','MarkerSize',12); hold on
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize', 12); axis('square')
set(gca,'visible','off')
