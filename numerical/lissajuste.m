numpasos1 = 1000;
numpasos2 = 1000;

p = 110e-6;
lambda = 550e-9;
tam = 2.07e-3;
zt = 2*p^2/lambda;
z1 = 50e-2;
z2 = 2*zt;
f = 5e-2;

%Para varios casos de descolimación
dz = linspace(-zt,zt,numpasos1);
gamma = zeros(size(dz));
for n=1:size(gamma)
    gamma(n) = (2*f^2+dz(n)*(2*f-z1))./(2*f^2+dz(n)*(2*f-z2));
end

x = zeros(numpasos2);
y = zeros(numpasos2);
eli = zeros(numpasos1);

critm = round(numpasos1/2);
critt = numpasos1-1;

tope = zeros(numpasos2,2);
lowe = zeros(numpasos2,2);
mide = zeros(numpasos2,2);
phi = linspace(0,2*pi,numpasos2);
for n=1:numpasos1
    g = gamma(n);
    for m=1:numpasos2
        fi = phi(m);
        x(n,m)=senal(fi,1,p,lambda,g,z2,tam);
        y(n,m)=senal(fi,2,p,lambda,g,z2,tam);
        
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
    
    eli(n)=elipticidad(x,y,phi);
end
    