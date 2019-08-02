function [p]= NodeLab3D(fd,bbox,ctps,ptol,radius,varargin)
[p] = node_placing (bbox , 5e+4 ,5e+5,ctps,radius);
p   = p(feval(fd,p,varargin{:})< eps,:); 

% if you want some fixed nodes 
if ~isempty(ctps)
    p=setdiff(p,ctps,'rows'); 
end

pfix=unique(ctps,'rows'); % REMOVE DUPLICATE ONES
p=[pfix; p];                                        
ib  = find(abs(fd([p]))< ptol);
p(ib,:) = [];
