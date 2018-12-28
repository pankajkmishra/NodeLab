function sdf = getsdf(xy, bdy )
% -------------------------------------
  dseg    = dsegment(xy, bdy);
  sdf   = (-1) .^ ( inpolygon ( xy(:,1), xy(:,2), bdy(:,1), bdy(:,2) ) );
  sdf   = sdf.* (min ( dseg, [], 2 ));
%---------------------------------------
