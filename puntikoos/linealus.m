function [A,B,R2,erro] = linealus(zl)
%Traure les dades teòriques
[dz,~,eps]=lissaexp(zl);
dz = dz*1000000;

[A,B,R2] = linealfit(dz,eps);
epsaj = zeros(size(dz));
N = max(size(dz));

for n=1:N
    epsaj(n) = A*dz(n)+B;
end

err = zeros(size(dz));

for n=1:N
    del = (eps(n)-B)/A;
    
    err(n) = del - dz(n);
end

erro = max(err);
end
