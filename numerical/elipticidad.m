function res = elipticidad(x,y,phi)
    aux = size(phi);
    
    d = zeros(aux);
    for n=1:aux
        ang = phi(n);
        opo = opsto(ang);
        pos = casi(phi,opo);
        
        dx = x(n)-x(pos);
        dy = y(n)-y(pos);
        d(n) = sqrt(dx.^2+dy.^2);
    end
    
    dmax = max(d);
    dmax = dmax(1);
    dmin = min(d);
    dmin = dmin(1);
    
    [pos1, pos2] = find([dmax, dmin]);
    
    if(pos2 > pos1)
        dx = dmax;
        dy = dmin;
    else
        dx = dmin;
        dy = dmax;
    end
end