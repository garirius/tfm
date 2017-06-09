function [A,B] = punts(perf,perx)
%Trau els punts corresponents a la figura de Lissajous d'un perfil
%d'intensitats
%   name de l'arxiu d'on carregar la info del perfil.
%   p del període de la màscara (en micres)

% pxsize = 2.2;
% perx = p/pxsize;
% load(name); %carreguem les variables inicials
A= zeros(1,8);
B= zeros(1,8);
for n=1:2
    for m=1:8
        mask = masky(m,n,size(perf,2),perx);
        aux = perf.*mask/255;
        
        if(n==1)
            A(m)=trapz(aux)/size(perf,2);
        else
            B(m)=trapz(aux)/size(perf,2);
        end
    end
end
plot(A,B,'o');
end

