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
    
    ph2 = phi(pos2(1)); %angle del m�nim
    %ph1 = phi(pos1(1));
    ph1 = ph2 + pi/2; %angle del m�xim
    % los ejes de la figura tienen que ser ortogonales
    ph1 = min([ph1, oposto(ph1)]);
    ph2 = min([ph2, oposto(ph2)]);
    
%     ang = ph1;
%     opo = oposto(ang);
%     pos1 = casi(phi,ang);
%     pos2 = casi(phi,opo);
%     fuq = [x(pos1) x(pos2)];
%     fuqme = [y(pos1) y(pos2)];
%     line(fuq,fuqme);
%     
%     ang = ph2;
%     opo = oposto(ang);
%     pos1 = casi(phi,ang);
%     pos2 = casi(phi,opo);
%     fuq = [x(pos1) x(pos2)];
%     fuqme = [y(pos1) y(pos2)];
%     line(fuq,fuqme);
    
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
end