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





% <NodeLab is a simple MATLAB-repository for node-generation and adaptive refinement 
% for testing, and implementing various meshfree methods for solving PDEs in arbitrary domains.>
%     Copyright (C) <2019>  <Pankaj K Mishra>
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
