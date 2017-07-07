function [eli, eps] = sacapar(A,B)
%SACAPAR Summary of this function goes here
%   Detailed explanation goes here
[r1,r2,~]=elipsajuste(A,B);
r1 = abs(r1);
r2 = abs(r2);
rmin = min([r1 r2]);
rmax = max([r1 r2]);
eli = sqrt(1-(rmin/rmax)^2);
eps = (r1-r2)/(r1+r2);
end

