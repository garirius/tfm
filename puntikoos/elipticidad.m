function [res,res2] = elipticidad(a,b,phi)
    ph2 = 3*pi/4; %angle del m�nim
    ph1 = pi/4; %angle del m�xim
    
    avga = mean(a);
    avgb = mean(b);
    x = zeros(size(a));
    y = zeros(size(b));
    s = max(size(a));
    
    for n=1:s
        x(n) = a(n) - avga;
        y(n) = b(n) - avgb;
    end
    
    pos1 = casi(phi,ph1);
    ant1 = casi(phi,oposto(ph1));
    pos2 = casi(phi,ph2);
    ant2 = casi(phi,oposto(ph2));
    
    deltax = x(pos1)-x(ant1);
    deltay = y(pos1)-y(ant1);
    dx = sqrt(deltax.^2+deltay.^2);
    
    deltax = x(pos2)-x(ant2);
    deltay = y(pos2)-y(ant2);
    dy = sqrt(deltax.^2+deltay.^2);
    
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
    
    if(dy > dx)
        dmin = dx;
        dmax = dy;
    else
        dmax = dx;
        dmin = dy;
    end
    
    res = sqrt(1-(dmin/dmax).^2);
    res2 = 1 - (dx/dy)^2;
         
end