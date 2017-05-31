function [y,dist] = poi(perfil)
    abajo = min(perfil);
    s = size(perfil);
    z = zeros(s(1));
    %Normalizamos
    for n=1:s(1)
        z(n)=perfil(n)-abajo(1);
    end
    
    arriba = max(z);
    for n=1:s(1)
        z(n) = z(n)./arriba(1);
    end
    
    y = [];
    si=[];
    fr=[];
    for n=1:s(1)
        x = z(n);
        if x>0.7
            si = [si,n];
        end
        
        if x<0.25
            fr = [fr,n];
        end
    end
    v = [];
    s = size(si);
    beg = 1;
    fin = 1;
    for n=1:(s(2)-1)
        if si(n+1)>(si(n)+1)
            fin = n;
            r = [];
            for k=beg:fin
                r = [r, si(n)];
            end
            v = [v, median(r)];
            beg = n+1;
        end
    end
    
    w = [];
    s = size(fr);
    beg = 1;
    fin = 1;
    for n=1:(s(2)-1)
        if fr(n+1)>(fr(n)+1)
            fin = n;
            r = [];
            for k=beg:fin
                r = [r, fr(n)];
            end
            w = [w, median(r)];
            beg = n+1;
        end
    end
    
    y = [v(1) w(1) v(2)];
    dist = v(2)-v(1);
end