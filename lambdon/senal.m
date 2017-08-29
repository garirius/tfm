function s = senal(phi,eje,p,lambda,gamma,z,tam)
    
    s = 0;
    %Variables del problema
    q = 2*pi./p;
    for n=[-5, -3, -1, 0, 1, 3, 5]
        for m=[-5, -3, -1, 0, 1, 3, 5]
            for r=[-5, -3, -1, 0, 1, 3, 5]
                fac = 1;
                fac = fac*spas(p,lambda,n,m,gamma,z);
                fac = fac*fourcoef(n)*conj(fourcoef(m))*fourcoef(r);
                fac = fac*exp(1i*r*(phi+eje*pi/2));
                fac = fac*sinq(pi*tam*terminus(n,m,r,gamma)/p);
                fac = fac*exp(1i*q*terminus(n,m,r,gamma)*(2*(eje-1.5)*tam));
                s = s + fac;
            end
        end
    end
end