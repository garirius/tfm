function S = masky(num,col,tam,perpx)
% Genera la num-�ssima m�scara de la col-�ssima columna
% amb una mida tam i un per�ode (en p�xels) perpx.

x = 1:tam;
S = square(2*pi*x/perpx + num*pi/4 + (col-1)*pi/2);

for n=x
    if(S(n)>0.5)
        S(n) = 1;
    else
        S(n) = 0;
    end
end

