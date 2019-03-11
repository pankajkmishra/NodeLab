%% test_3Lake
% This test generates non-uniform nodes inside a arbitrary 
% Lake-shaped domain within a bounding box (100.0 145.0)x(634.0 799.0).
% The node-density is highest near the boundary. In this test, the
% boundary points have been used as the control-points: 'ctps'

clear variables; close all; clc
%--------------------------------------------
box  = [100.0, 145.0; 634.0, 799.0 ];
hbdy = 6; 
ptol = 1;
[b]  = make_domain('lake.txt'); % process lake points as boundary
[bdy] = bsmooth(b.xy, hbdy);
ctps  = bdy; 
radius = @(p,ctps) 3 + 0.2*(min(pdist2(ctps, p)));
[xy]  = NodeLab2D(b.sdf,box,ctps,ptol,radius);

%--------------------------------------------
plot(xy(:,1), xy(:,2),'.k','MarkerSize',10); hold on
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize', 10); axis('square')
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
