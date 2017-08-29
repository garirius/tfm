function puntikus(zl)
% zl en micras
numpasos1 = 3;
numpasos2 = 200;
numpasos3 = 8;

p = 110e-6;
lambda = 595e-9;
tam = 2.07e-3;
zt = 2*p^2/lambda;
z1 = 24e-2;
z2 = zt;
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

critm = round(numpasos1/2);
critt = numpasos1;
tope = zeros(numpasos2,2);
lowe = zeros(numpasos2,2);
mide = zeros(numpasos2,2);
phi = linspace(0,2*pi,numpasos2);
h1 = waitbar(0,'Calculando...');

for n=1:numpasos1
    g = gamma(n);
    for m=1:numpasos2
        fi = phi(m);
        x(n,m)=real(senal(fi,1,p,lambda,g,z2,tam));
        y(n,m)=real(senal(fi,2,p,lambda,g,z2,tam));
        if n==1
            lowe(m,1)=x(n,m);
            lowe(m,2)=y(n,m);
        elseif n==critm
            mide(m,1)=x(n,m);
            mide(m,2)=y(n,m);
        elseif n==critt
            tope(m,1)=x(n,m);
            tope(m,2)=y(n,m);
        end
    end
    %plot(x(n,:),y(n,:));
    waitbar(n/(2*numpasos1),h1);
end
h = figure;
hold on
plot(lowe(:,1),lowe(:,2),'LineWidth',1)
plot(mide(:,1),mide(:,2),'LineWidth',1)
plot(tope(:,1),tope(:,2),'LineWidth',1)
%title('Figuras de Lissajous varias');
leg1 = ['\Delta z =' num2str(-zl*1000000) ' \mu m'];
leg2 = ['\Delta z = 0 \mu m'];
leg3 = ['\Delta z =' num2str(zl*1000000) ' \mu m'];
legend(leg1,leg2,leg3);
xlabel('S_A (u.a.)');
ylabel('S_B (u.a.)');

phi = [0 pi/4 pi/2 3*pi/4 pi 5*pi/4 3*pi/2 7*pi/4];
x = zeros(numpasos3,1);
y = zeros(numpasos3,1);
set(gca, 'ColorOrderIndex', 1);
for n=1:numpasos1
    g = gamma(n);
    for m=1:numpasos3
        fi = phi(m);
        x(n,m)=real(senal(fi,1,p,lambda,g,z2,tam));
        y(n,m)=real(senal(fi,2,p,lambda,g,z2,tam));
    end
    plot(x(n,:),y(n,:),'o','MarkerSize',10,'LineWidth',2);
    waitbar(0.5+n/numpasos1,h1);
end
close(h1);
saveas(h,'puntikus.png');
hold off
end
    