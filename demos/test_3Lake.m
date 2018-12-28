% unit circle
clear variables; close all; clc
%--------------------------------------------
box  = [100.0, 145.0; 634.0, 799.0 ];
hbdy = 5; 
ptol = 1;
[b]  = make_domain('lake.txt'); % process lake points as boundary
[bdy] = bsmooth(b.xy, hbdy);
ctps  = bdy;
%radius = @(p,ctps) 6 ; 
radius = @(p,ctps) 3 + 0.2*(min(pdist2(ctps, p)));
[xy]  = NodeLab2D(b.sdf,box,ctps,ptol,radius);

%--------------------------------------------
plot(xy(:,1), xy(:,2),'.k','MarkerSize',10); hold on
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize', 10); axis('square')
set(gca,'visible','off')
