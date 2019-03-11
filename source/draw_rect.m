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
