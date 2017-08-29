function [lam,err] = dependencia(zl)

num1 = 50;
lam = linspace(400,700,num1);
err = zeros(num1,1);

h1 = waitbar(0,'Calculandetibus...');
for n=1:num1
    err(n) = linealus2(zl,lam(n));
    waitbar(n/num1,h1);
end
close(h1);

plot(lam,err)
end

