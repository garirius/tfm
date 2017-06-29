function con = contraste(perfil)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

umbral = mean(perfil);
arriba = [];
abajo = [];

for i=1:size(perfil)
    ele = perfil(i);
    if(ele > umbral)
        arriba = [arriba ele];
    else
        abajo = [abajo ele];
    end
end

arriba = mean(arriba);
abajo = mean(abajo);

con=(arriba-abajo)/(arriba+abajo);
end

