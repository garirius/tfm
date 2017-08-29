function [dz,eli,eps] = lissaexp2(zl,lambda)
% zl en micras
numpasos1 = 51;
numpasos2 = 8;
lambda = lambda/1000000000;
p = 110e-6;
tam = 2.07e-3;
zt = 2*p^2/lambda;
z2 = zt;
z1 = 24e-2;
f = 5e-2;
zl = zl/1000000;
%Para varios casos de descolimaci�n
dz = linspace(-zl,zl,numpasos1);
gamma = zeros(size(dz));
for n=1:numpasos1
    a = (dz(n)+0.000002)/(2*f^2+(dz(n)+0.000002)*(2*f-z1));
    gamma(n) = 1/(1+z2*a);
end

x = zeros(numpasos2,1);
y = zeros(numpasos2,1);
eli = zeros(numpasos1,1);
eps = zeros(numpasos1,1);

phi = [0 pi/4 pi/2 3*pi/4 pi 5*pi/4 3*pi/2 7*pi/4];%linspace(0,2*pi,numpasos2);

for n=1:numpasos1
    g = gamma(n);
    for m=1:numpasos2
        fi = phi(m);
        x(n,m)=real(senal(fi,1,p,lambda,g,z2,tam));
        y(n,m)=real(senal(fi,2,p,lambda,g,z2,tam));
    end
    
    [eli(n),eps(n)]=eliajus(x(n,:),y(n,:));
end
end
    

