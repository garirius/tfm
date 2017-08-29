function [a,b] = rot(x,y,xm,ym)

N = max(size(x));
a = zeros(size(x));
b = zeros(size(y));
for n=1:N
    a(n) = x(n) + xm;
    b(n) = y(n) + ym;
end

end

