function [b] = make_domain(fileName)
%INPUT THE BOUNDARY POINT
b.xy  = load(fileName);
b.sdf = @(p) getsdf(p,b.xy );
end

