% unit circle
clear variables; close all; clc
%-----------------------------------------
box  = [100.0, 145.0; 634.0, 799.0 ];
hbdy = 5; 
ptol = 1;
[b1]  = make_domain('lake.txt'); % process lake points as boundary
[b2]  = make_domain('island.txt');
b.sdf = @(p) max(b1.sdf(p), -b2.sdf(p)) ;
b1.xy = bsmooth(b1.xy, hbdy);
b2.xy = bsmooth(b2.xy, hbdy);
b.xy = [b1.xy; b2.xy];
ctps = b.xy;
radius = @(p,ctps) 3 + 0.2*(min(pdist2(ctps, p)));
[x]  = NodeLab2D(b.sdf,box,ctps,ptol,radius);
%-----------------------------------------
plot(x(:,1), x(:,2),'.k','MarkerSize',8); hold on
plot(b.xy(:,1), b.xy(:,2), '.k','MarkerSize', 8); axis('square');
set(gca,'visible','off')
