function p = node_placing (box ,ninit, dotmax,ctps, radius)
%This code has been modified from the following paper
%Bengt Fornberg, Natasha Flyer (2015),
%Fast generation of 2-D node distributions for mesh-free PDE discretizations,
%Computers & Mathematics with Applications, 69(7) 531-544
% --- Input parameters ---
% box    Size of box to be filled by nodes: [xmin,xmax,ymin,ymax]
% ninit  Upper limit on number of PDP entries
% dotmax Upper bound for number of dots to place
% radius The function radius (p) provides grain radius to be used
% at location p(x,y).
% --- Output parameter ---
% p     Array p(:,2) with the generated node locations
dotnr = 0 ;           % Counter for the placed dots
rng ( 0 ) ;           % Initialize random number generator
pdp = [linspace(box(1),box(2),ninit)',box(3)+1e-4*rand(ninit,1)];
pdp_end = ninit;      % Number of PDPs in use
p = zeros(dotmax,2); % Array to store produced dot locations
[ym,i] = min(pdp(1:pdp_end,2)); % Locate PDP with lowest y-coordinate
while ym <= box(4) && dotnr < dotmax  % Loop over all dots that are to be placed
    dotnr = dotnr+1;           % Keep count for next dot to be placed
    p(dotnr,:) = pdp(i,:);     % Place the dot
    r = radius(p(dotnr,:),ctps);
    %r = 0.005+0.01*(min(pdist2(ctps, p(dotnr,:))));
    %r = 2+0.1*(min(pdist2(ctpts, p(dotnr,:)))); %for Lake
    % --- Calculate the distance from the placed dot to all present PDPs
    dist2 = (pdp(1:pdp_end,1) - pdp(i,1)).^2+(pdp(1:pdp_end,2) - pdp(i,2)).^2 ;
    % --- Find nearest old PDP to the left, outside the new circle
    ileft = find(dist2(1:i) > r^2,1,'last') ;
    if isempty(ileft) 
        ileft = 0; % Special case if no such point
        ang_left = pi;
    else
        ang_left = atan2(pdp(ileft,2)-pdp(i,2),pdp(ileft,1)-pdp(i,1));
    end
    % --- Find nearest old PDP to the right, outside the new circle
    iright = find(dist2(i:pdp_end) > r^2,1,'first');
    if isempty(iright);
        iright    = 0 ; % Special case if no such point
        ang_right = 0 ;
    else
        ang_right = atan2(pdp(i+iright-1,2)-pdp(i,2),pdp(i+iright-1,1)-pdp(i,1));
    end
    % --- Introduce five new markers along the circle sector, equispaced in angle
    ang = ang_left - [0.1;0.3;0.5;0.7;0.9]*(ang_left-ang_right);
    pdp_new = [pdp(i,1)+r*cos(ang),pdp(i,2)+r*sin(ang)] ;
    ind = pdp_new(:,1) < box(1)| pdp_new(:,1) > box(2);
    pdp_new(ind,:) = [ ];       % Remove any new PDPs outside the domain
    nw = length(pdp_new(:,1));  % Number of new markers to be inserted
    % --- Remove obsolete and insert new PDPs in the array pdp
    if iright == 0              % Place rightmost block of old PDPs
        pdp_end = ileft+nw;     % to the right of the block of the new PDPs
    else
        ind = i+iright-1:pdp_end;
        pdp_end = ileft+nw+pdp_end-i-iright+2;
        pdp(ileft+nw+1:pdp_end,:) = pdp(ind,:);
    end
    pdp(ileft+1:ileft+nw,:) = pdp_new; % Insert the new PDPs into pdp
    % --- Identify next dot location, then iterate until all dots are placed
    [ym,i] = min(pdp(1:pdp_end,2));
end
p = p(1:dotnr,:);         % Remove unused entries in array p
