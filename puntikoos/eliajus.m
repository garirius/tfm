function [eli,eps] = eliajus(A,B)
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
    
    if c<0
        eli = sqrt(2*c/(2*b+c));
    else
        eli = sqrt(-2*c/(2*b-c));
    end
    
    eps = 1-(2*b-c)/(2*b+c);
else
    out = 'Las matrices no comparten tama�o.'
    eps = NaN;
    eli = NaN;
end

end


