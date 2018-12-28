# NodeLab  
NodeLab is a simple MATLAB-package for unstructured node-generation and refinement for meshfree modeling in arbitrary domains. The final output is two variables, which can be seen in the 'workspace'.
  * *xy* — an array containing interior nodes.
  * *bdy*— an array containing boundary nodes. 

# Installation
* Download the package on your PC. 
* Open MATLAB
* Go to the directory 'NodeLab'
* run the script 'setup.m'. This will add different directories of the NodeLab on your MATLAB path — only for the current session. Now you are ready to run the demos and generate nodes for your own project. 

# Tutorials
#### 1. Regular nodes in circle within [-1,1]^2
Omega = (-1,1)</sup>^2 
```matlab {.line-numbers}
fs= 100;
[filt_b, filt_a]= butter(5, [10 14]/fs*2);
state_acquire= ACQUIRE_FCN('init', 'fs',fs);
state_filter= [];
t_start= clock;
while etime(clock, t_start) < 10*60,
  cnt_new= AQCQUIRE_FCN(state_acquire);
  [cnt_new, state_filter]= online_filt(cnt_new, state_filter, filt_b, filt.a);
  cnt= proc_appendCnt(cnt, cnt_new);
  mrk= struct('fs',cnt.fs, 'pos',size(cnt.x,1));
  epo= proc_segmentation(cnt, mrk, [-500 0]);
  fv= proc_logarithm( proc_variance( epo ));
  out= apply_separatingHyperplane(LDA, fv.x(:));
  send_xml_udp('cl_output', out);
end
```
