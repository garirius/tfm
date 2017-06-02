function [res,res2] = elipticidad(x,y,phi)
    aux = size(phi);
    aux = aux(2);
    d = zeros(aux);
    for n=1:aux
        ang = phi(n);
        opo = oposto(ang);
        pos = casi(phi,opo);

        dx = x(n)-x(pos);
        dy = y(n)-y(pos);
        
        d(n) = sqrt(dx.^2+dy.^2);
    end
    dmax = max(d);
    dmax = dmax(1);
    dmin = min(d);
    dmin = dmin(1);
    
    pos1 = find(d==dmax);
    pos2 = find(d==dmin);
    
    ph1 = phi(pos1(1)); %angle del màxim
    ph2 = phi(pos2(1)); %angle del mínim
   
    ph1 = min([ph1, oposto(ph1)]);
    ph2 = min([ph2, oposto(ph2)]);
       
    ph1 = pascualangulo(x,y,phi,ph1);
    ph2 = pi - ph1;
    
    if(ph1 > ph2)
        dx = dmin;
        dy = dmax;
        px = ph2;
        py = ph1;
    else
        dx = dmax;
        dy = dmin;
        px = ph1;
        py = ph2;
    end
    
    res = sqrt(1-(dmin/dmax).^2);
    res2 = (dy-dx)/(dx+dy);
    hold off
end