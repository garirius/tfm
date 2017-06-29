load('testmot.mat');
[m,siz] = size(s);
periodo = 110;
pxsize = 2.2;
periodo = periodo/pxsize;
ind = linspace(1,m,m/10);
ind = round(ind);
fu = size(ind);
qua = zeros(fu);
eli = zeros(fu);
eps = zeros(fu);
Z = zeros(fu);
A = zeros(fu(2),8);
B = zeros(fu(2),8);
n = 1;
for k=ind
    perf = s(k,:);
    [A(n,:),B(n,:)] = punts(perf,periodo);
    Z(n) = Y(k);
    n = n+1;
end

xm = max(A);
ym = max(B);
xm = max([xm,ym]);
A = A./xm;
B = B./xm;
w = waitbar(0,'Procesando...');

for k=1:fu(2)
    senA = A(k,:);
    senB = B(k,:);
    [r1,r2,qua(k)]=elipsajuste(senA,senB);
    r1 = abs(r1);
    r2 = abs(r2);
    if r1 > r2
        rmax = r1;
        rmin = r2;
    else
        rmax = r2;
        rmin = r1;
    end
    eli(k) = sqrt(1-(rmin/rmax)^2);
    eps(k) = (r1-r2)/(r1+r2);
    waitbar(k/m,w);
end
close(w);

hold on
plot(Z,eli,'--');
plot(Z,eps,'--');
%plot(Y,qua);
xlabel('z (\mu m)');
legend('Elipticidad','Eliptancia');