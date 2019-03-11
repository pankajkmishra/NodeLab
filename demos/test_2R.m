%% test_2R
% % This test generates non-uniform nodes inside a rectangle (square) within 
% a bounding box (-1,1)^2. The node-density is highest at the 
% two control points: 'ctps'.

clear variables; close all; clc
%------------------------------------------------
box    = [-1,-1; 1,1];
hbdy   = 0.02;
ptol   = 0.001;
%ctps   = [];
ctps   = [-0.5,1; 0.5, 1];
%ctps   = [linspace(-0.5, 0.5,10); 0.5*ones(1,10)]';
radius = @(p,ctps) 0.005+0.05*(min(pdist2(ctps, p)));
%radius = @(p, ctps) 0.05;
[b]    = draw_rect(-1,-1,1,1,2/hbdy);
[xy]   = NodeLab2D(b.sdf,box,ctps,ptol,radius);
[bdy]  = b.xy;
clear box hbdy ptol ctps radius b
%---------------------------------------------------
plot(xy(:,1), xy(:,2),'.k','MarkerSize',12);hold on
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize',12); axis('square')
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
