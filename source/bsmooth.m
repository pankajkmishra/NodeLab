function b_new = bsmooth(b, h0)
%Author: Pankaj K Mishra 
% method = linear: Fast but ungly looking.
% method = spline: A bit slower but looks awesome.
method = 'linear';
bxmin = min(b(:,1));
bxmax = max(b(:,1));

bqx = [bxmin:h0/5:bxmax]';
b_new = interparc(length(bqx), b(:,1), b(:,2), method);

