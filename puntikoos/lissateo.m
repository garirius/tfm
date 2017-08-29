function [dz,eli,eps] = lissateo(zl)
% zl en micras
numpasos1 = 201;
numpasos2 = 4;

p = 110e-6;
lambda = 595e-9;
tam = 2.07e-3;
zt = 2*p^2/lambda;
z1 = 24e-2;
z2 = zt;
f = 5e-2;
zl = zl/1000000;
%Para varios casos de descolimaciï¿½n
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

phi = [pi/4 3*pi/4 5*pi/4 7*pi/4];%linspace(0,2*pi,numpasos2);
h1 = waitbar(0,'Calculando teoría...');

for n=1:numpasos1
    g = gamma(n);
    for m=1:numpasos2
        fi = phi(m);
        x(n,m)=real(senal(fi,1,p,lambda,g,z2,tam));
        y(n,m)=real(senal(fi,2,p,lambda,g,z2,tam));
    end
    
    [eli(n),eps(n)]=elipticidad(x(n,:),y(n,:),phi);
    waitbar(n/numpasos1,h1);
end
close(h1);
end
    
