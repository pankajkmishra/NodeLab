function b_new = bsmooth(b, h0)
%Author: Pankaj K Mishra 
% method = linear: Fast but ungly looking.
% method = spline: A bit slower but looks awesome.
method = 'linear';
bxmin = min(b(:,1));
bxmax = max(b(:,1));

bqx = [bxmin:h0/5:bxmax]';
b_new = interparc(length(bqx), b(:,1), b(:,2), method);





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
