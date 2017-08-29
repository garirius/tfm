function res = spas(p,lambda,n,m,gamma,z)
    k = 2*pi/lambda;
    q = 2*pi/p;
    
    res = exp(-1i*q^2*(n^2-m^2)*z*gamma/(2*k));
end