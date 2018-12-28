function setup
thisDir = pwd;
thisOS = system_dependent('getos');
if(strfind(thisOS,'Windows')>0)  % Consider replacing with pathsep
    dirslash = '\';
else
    dirslash = '/';
end

sourceDir = strcat(thisDir,dirslash,'source');
extsrcDir = strcat(sourceDir,dirslash,'ext');
demoDir = strcat(thisDir,dirslash,'demos');

addpath(thisDir,sourceDir,extsrcDir,demoDir,'-begin');
clc
