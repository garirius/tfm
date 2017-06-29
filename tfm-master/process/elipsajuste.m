function [r1,r2,s] = elipsajuste(A,B)
%Realiza un ajuste de una figura de Lissajous dados los puntos A,B

if(size(A)==size(B))
    m = size(A,2);
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
    
    for n=1:m
        x = A(n);
        y = B(n);
    end
    r1 = sqrt(2/(c-2*b));
    r2 = sqrt(-2/(2*b+c));
    s = 4*sqrt(abs(a/(4*b^2-c^2)));
    
%     hold on
%     grid on
%     func = [num2str(a) '*(x^2-y^2)^2+'];
%     func = [func num2str(b) '*(x^2+y^2)+'];
%     func = [func num2str(c) '*x*y+1'];
%     ezplot(func);
%     plot(A,B,'o');
%     xlim([min(A)*1.1 max(A)*1.1]);
%     ylim([min(B)*1.1 max(B)*1.1]);
else
    out = 'Las matrices no comparten tama�o.'
    s = NaN;
    r1 = NaN;
    r2 = NaN;
end

end

