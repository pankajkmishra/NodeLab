function [b] = draw_rect(x1, y1, x2, y2,n)
% Add some points on the boundary,Distinguish between the Dirichlet and Neumann boundaries
b1 = [linspace(x1,x2,n);y1*ones(n,1)']';
b2 = [x2*ones(n,1)';linspace(y1,y2,n)]';
b3 = [linspace(x1,x2,n);y2*ones(n,1)']';
b4 = [x1*ones(n,1)';linspace(y1,y2,n)]';

B = [b1;b2(2:end,:);b3(1:end-1,:);b4(2:end-1,:)];
b.xy  = [B(:,1), B(:,2)];

b.sdf= @(p) -min(min(min(-y1+p(:,2),y2-p(:,2)),-x1+p(:,1)),x2-p(:,1));

end
