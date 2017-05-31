function s = senal(phi,eje,p,lambda,gamma,z,tam)
    
    s = 0;
    
    %Variables del problema
    umbral = 1000;
    q = 2*pi./p;
    
    w1 = waitbar(0,['Sumando para eje ' num2str(eje) '...']);
    for n=-umbral:umbral
        w2 = waitbar(0,['Sumando para n=' num2str(n) '...']);
        for m=-umbral:umbral
            w3 = waitbar(0,['Sumando para m=' num2str(m) '...']);
            for r=-umbral:umbral
                fac = 1;
                fac = fac*spas(p,lambda,n,m,gamma,z);
                fac = fac*fourcoef(n)*conj(fourcoef(m))*fourcoef(r);
                fac = fac*exp(1i*r*(phi+eje*pi/2));
                fac = fac*sinq(pi*tam*terminus(n,m,r,gamma)/p);
                fac = fac*exp(1i*q*terminus(n,m,r,gamma)*tam/2);
                s = s + fac;
                waitbar((r+umbral)/(2*umbral),w3);
            end
            close(w3);
            waitbar((m+umbral)/(2*umbral),w2);
        end
        close(w2);
        waitbar((n+umbral)/(2*umbral),w1);
    end
    close(w1);

end