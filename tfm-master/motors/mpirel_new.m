function mpirel_new(ID,eje,movrel)
% Creada por Francisco Torcal a partir de ShortSample
%27/04/2016
%Esta funcion mueve el "eje" (puede ser 1 o 2) en relativo
%movrel hay que ponerlo con el signo y va en micras
ID.MVR(num2str(eje), movrel/1000)


