function fig = punticur(pos,col)

numpasos = 200;
p = 110e-6;
lambda = 595e-9;
tam = 2.07e-3;
zt = 2*p^2/lambda;
z1 = 24e-2;
z2 = zt;
f = 5e-2;
pos = pos/1000000;

a = pos/(2*f^2+pos*(2*f-z1));
g = 1/(1+z2*a);

curx = zeros(numpasos,1);
cury = zeros(numpasos,1);
phi = linspace(0,2*pi,numpasos);
%curva teòrica
h1 = waitbar(0,'Calculando...');
for m=1:numpasos
    fi = phi(m);
    curx(m)= real(senal(fi,1,p,lambda,g,z2,tam));
    cury(m)=real(senal(fi,2,p,lambda,g,z2,tam));
    waitbar(m/(numpasos+8),h1);
end
hold on
set(gca, 'ColorOrderIndex', col);
plot(curx,cury,'--','LineWidth',1.5);

x = zeros(8,1);
y = zeros(8,1);
phi = [0 pi/4 pi/2 3*pi/4 pi 5*pi/4 3*pi/2 7*pi/4];
%punts discrets
for m=1:8
    fi = phi(m);
    x(m) = real(senal(fi,1,p,lambda,g,z2,tam));
    y(m)=real(senal(fi,2,p,lambda,g,z2,tam));
    waitbar(1-(numpasos+8-m)/(numpasos+8),h1);
end
close(h1);

fig = eliajus2(x,y,col);
end
