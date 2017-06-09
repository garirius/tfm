function [a,b,c] = elipsajuste(A,B)
%Realiza un ajuste de una figura de Lissajous dados los puntos A,B

if(size(A)==size(B))
    m = size(A,2);
    M = zeros(m,3);
    N = zeros(m,1);
    for n=1:m
        x = A(n);
        y = B(n);
        
        M(n,1) = (x^2-y^2)^2;
        M(n,2) = x^2 + y^2;
        M(n,3) = x*y;
        N(n) = -1;
    end
    %resolem el sistema
    sol = N\M;
    a = sol(1);
    b = sol(2);
    c = sol(3);
    
%     r1 = sqrt(2/(c-2*b));
%     r2 = sqrt(-2/(2*b+c));
%     s = sqrt((16*a^2)/(4*b^2-c^2));
    
    hold on
    func = [num2str(a) '*(x^2-y^2)^2+'];
    func = [func num2str(b) '*(x^2+y^2)+'];
    func = [func num2str(c) '*x*y+1'];
    ezplot(func);
    plot(A,B,'o');
else
    out = 'Las matrices no comparten tamaño.'
    s = NaN;
    r1 = NaN;
    r2 = NaN;
end

end

