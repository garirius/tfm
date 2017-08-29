function erro = linealus2(zl,lambda)
%Traure les dades teòriques
[dz,~,eps]=lissaexp2(zl,lambda);
dz = dz*1000000;

[A,B,~] = linealfit(dz,eps);
epsaj = zeros(size(dz));
N = max(size(dz));

for n=1:N
    epsaj(n) = A*dz(n)+B;
end

err = zeros(size(dz));

for n=1:N
    del = (eps(n)-B)/A;
    
    err(n) = abs(del - dz(n));
end

erro = max(err);
end
