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
