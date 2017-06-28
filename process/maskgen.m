function S = maskgen(sample,perpx,n,m)
%Genera una máscara bmp compleja de n*m redes de difracción
%de periodo perpx con un tamaño de la imagen sample

tam = size(sample);
%Tamaño de cada celda
mini = [tam(1)/n tam(2)/m];
mini = round(mini);
S = zeros(tam);
for i=1:m
    for j=1:n
        beg = [1+mini(1)*(j-1) 1+mini(2)*(i-1)];
        fin = [mini(1)*j mini(2)*i];
        ji = square(2*pi*(1:tam(2))/perpx + pi*(j-1)/4 + pi*(i-1)/2);
        for k=beg(2):fin(2)
            for l=beg(1):fin(1)
                S(l,k) = 0.5*(ji(k)+1);
            end
        end
    end
end
end

