numpasos1 = 100;
numpasos2 = 200;

p = 110e-6;
lambda = 550e-9;
tam = 2.07e-3;
zt = 2*p^2/lambda;
z1 = 50e-2;
z2 = zt;
f = 5e-2;
zl = 50e-5;

%Para varios casos de descolimación
dz = linspace(-zl,zl,numpasos1);
gamma = zeros(size(dz));
for n=1:numpasos1
    a = 2*f-z1;
    a = 2*f^2+dz(n)*a;
    gamma(n) = a./(a+dz(n)*z2);
end

x = zeros(numpasos2,1);
y = zeros(numpasos2,1);
eli = zeros(numpasos1,1);
eps = zeros(numpasos1,1);

critm = round(numpasos1/2);
critt = numpasos1;

tope = zeros(numpasos2,2);
lowe = zeros(numpasos2,2);
mide = zeros(numpasos2,2);
phi = linspace(0,2*pi,numpasos2);
h1 = waitbar(0,'Calculando...');
hold off
for n=1:numpasos1
    g = gamma(n);
    for m=1:numpasos2
        fi = phi(m);
        x(n,m)=abs(senal(fi,1,p,lambda,g,z2,tam));
        y(n,m)=abs(senal(fi,2,p,lambda,g,z2,tam));
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
    [eli(n),eps(n)]=elipticidad(x(n,:),y(n,:),phi);
    waitbar(n/numpasos1,h1);
end
close(h1);
h = figure;
hold on
plot(lowe(:,1),lowe(:,2))
plot(mide(:,1),mide(:,2))
plot(tope(:,1),tope(:,2))
title('Figuras de Lissajous varias');
leg1 = ['\Delta z =' num2str(-zl*1000000) ' \mu m'];
leg2 = ['\Delta z = 0 \mu m'];
leg3 = ['\Delta z =' num2str(zl*1000000) ' \mu m'];
legend(leg1,leg2,leg3);
xlabel('S_A (u.a.)');
ylabel('S_B (u.a.)');
hold off

w = figure;
hold on
dz = dz*1000000;
[fp, pf, we]=plotyy(dz,eli,dz,eps);
ylabel(fp(1),'Elipticidad');
ylabel(fp(2),'Eliptancia');
title('Elipticidades');
xlabel('Desenfoque (\mu m)');
    