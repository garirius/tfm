s = 0;
p = 1;
X = -5:0.01:5;
for n=-100:100
    a = fourcoef(n);
    s = s + a*exp(1i*X*n*2*pi/p);
end

plot(X,s)

%%
num = 500;
phi = linspace(0,2*pi,1000);
phi2 = linspace(0,2*pi,num);
elip = zeros(num,1);
epsi = zeros(num,1);
h = waitbar(0,'Alcanzando el Nirvana');
for n=1:num
    X = sin(phi);
    Y = sin(phi+phi2(n));

    plot(X,Y);
    hold on
    [elip(n),epsi(n)] = elipticidad(X,Y,phi);
    waitbar(n/num,h);
end
close(h);
close all
hold on
plot(phi2/pi,elip)
plot(phi2/pi,epsi)
legend('e','\epsilon');