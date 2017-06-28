function [A,B] = sacasig(imago,mask,n,m)
%Saca los puntos de Lissajous a partir de imago y una
% mask compleja de n*m redes de difracción
A= zeros(1,8);
B= zeros(1,8);
tam = size(imago);
%Tamaño de cada celda
mini = [tam(1)/n tam(2)/m];
mini = round(mini);
over = imago.*mask;
for i=1:m
    for j=1:n
        if(i==1)
            A(j) = 0;
        else
            B(j) = 0;
        end
        
        beg = [1+mini(1)*(j-1) 1+mini(2)*(i-1)];
        fin = [mini(1)*j mini(2)*i];
        aux = over(beg(1):fin(1),beg(2):fin(2));
        
        for k=1:(fin(1)-beg(1))
            if(i==1)
                A(j)=A(j)+trapz(aux(k,:))/(mini(1)*mini(2));
            else
                B(j)=B(j)+trapz(aux(k,:))/(mini(1)*mini(2));
            end
        end
    end
end

xm = mean(A);
ym = mean(B);
for i=1:n
    A(i) = A(i)-xm;
    B(i) = B(i)-ym;
end
%plot(A,B,'o');
end

