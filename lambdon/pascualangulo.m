function res = pascualangulo(x,y,phi,ang)
    opo = oposto(ang);
    pos = casi(phi,opo);
    n = casi(phi, ang);
    
    deltax = x(n)-x(pos);
    deltay = y(n)-y(pos);
    
    res = atan2(deltay,deltax);
    
    if(res < 0)
        res = res+2*pi;
    end
    
    res = min([res oposto(res)]);
end