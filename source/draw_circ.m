function [b] = draw_circ(xc,yc,r,n)
% Add some points on the boundary,Distinguish between the Dirichlet and Neumann boundaries
th = 0:pi/n:2*pi;
b.xy(:,1) = (r * cos(th) + xc)';
b.xy(:,2) = (r * sin(th) + yc)';

b.sdf= @(p) sqrt((p(:,1)-xc).^2+(p(:,2)-yc).^2)-r;

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
