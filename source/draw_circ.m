function [b] = draw_circ(xc,yc,r,n)
% Add some points on the boundary,Distinguish between the Dirichlet and Neumann boundaries
th = 0:pi/n:2*pi;
b.xy(:,1) = (r * cos(th) + xc)';
b.xy(:,2) = (r * sin(th) + yc)';

b.sdf= @(p) sqrt((p(:,1)-xc).^2+(p(:,2)-yc).^2)-r;

end
