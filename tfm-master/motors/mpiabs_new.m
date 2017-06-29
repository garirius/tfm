function mpiabs_new(ID,eje,movabs)
% Creada por Francisco Torcal a partir de ShortSample
%27/04/2016
%Esta funcion mueve el "eje" (puede ser 1 o 2) en absoluto
%movabs hay que ponerlo con el signo y va en micras
%Leo cuales son los límites y veo la posición dada está dentro de los
%límites

dMin = ID.qTMN(num2str(eje));
dMax = ID.qTMX(num2str(eje));
if movabs/1000 >dMax || movabs/1000 < dMin
    error(strcat('la posición está fuera de los límites que son:_',num2str(dMin*1000),'_y_', num2str(dMax*1000),'_micras'))
else
    ID.MOV(num2str(eje), movabs/1000)
end
