%-----------------------------------
clear varibale; close all; clc
box    = [-1,-1; 1,1];
hbdy   = 0.02;
ptol   = 0.001;
[b]    = draw_circ(0,0,1,2/hbdy);
%ctps   = [0,0];
ctps   = [linspace(-0.5, 0.5,10); zeros(1,10)]';        
%radius = @(p,ctps) 0.05; % for fixed node-density
radius = @(p,ctps) 0.005+0.08*(min(pdist2(ctps, p))); % for variable node-density
[xy]   = NodeLab2D(b.sdf,box,ctps,ptol, radius);
[bdy]  = b.xy;
clear box hbdy ptol ctps radius b
%-------------------------------------
plot(xy(:,1), xy(:,2),'.k','MarkerSize',12)
hold on
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize',12)
axis('square'); set(gca,'visible','off')

