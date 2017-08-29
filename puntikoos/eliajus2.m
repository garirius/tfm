function fig = eliajus2(A,B,col)
%Realiza un ajuste de una figura de Lissajous dados los puntos A,B

if(size(A)==size(B))
    m = max(size(A));
    M = zeros(m,3);
    N = zeros(m,1);
    xm = mean(A);
    ym = mean(B);
    for n=1:m
        x = A(n)-xm;
        y = B(n)-ym;
        M(n,1) = (x^2-y^2).^2;
        M(n,2) = (x^2+y^2);
        M(n,3) = x*y;
        N(n,1) = -1; 
    end
    %resolvemos el sistema
    sol = inv(transpose(M)*M)*transpose(M)*N;
    a = sol(1);
    b = sol(2);
    c = sol(3);
        
    s = 4*sqrt(a/(4*b^2-c^2));
    r1 = sqrt(-2/(2*b+c));
    r2 = sqrt(-2/(2*b-c));
    
    [x,y] = elipson(r1,r2,s);
    [x,y] = rot(x,y,xm,ym);
    set(gca, 'ColorOrderIndex', col);
    plot(A,B,'o','LineWidth',2);
    set(gca, 'ColorOrderIndex', col);
    fig = plot(x,y,'LineWidth',1.5);
    
    grid on
else
    out = 'Las matrices no comparten tama�o.'
    s = NaN;
    r1 = NaN;
    r2 = NaN;
    c = NaN;
    eli = NaN;
end

end


