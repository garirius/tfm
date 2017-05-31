function cont=cosastalbot(ID,Cam,camara,distancia,nombre)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% distancia en centímetros
numeropasos = 1000;
empieza = 0;
step = distancia*10000/numeropasos;

%Inicializamos nuestras mierdas
IniciaCamara(Cam,camara);
Cam.ExposureAuto = 0;
mpiabs_new(ID,1,empieza);

%Sacamos el tamaño del array de sacaperfil
aux = Captura(Cam,camara);
aux = rgb2gray(aux);
aux = sacaperfil(aux);
aux = size(aux);
aux = aux(1);

s = zeros(numeropasos,aux);
cont = zeros(numeropasos,1);
%vamos tomando medidas
barra = waitbar(0/numeropasos,'Alcanzando el Nirvana...');
for i=1:numeropasos
    %primero quenada tomar captura
    imago = Captura(Cam,camara);
    imago = rgb2gray(imago);
    tempo = sacaperfil(imago);
    cont(i) = contraste(tempo);
    
    for j=1:size(tempo)
        s(i,j) = tempo(j);
    end
    
    mpirel_wait_new(ID,1,step);
    waitbar(i/numeropasos);
end
close(barra);
Y=linspace(empieza,empieza+distancia,numeropasos);
X=linspace(0,(aux-1)*2.2,aux);
% surface in 3D
h = figure;
surf(X,Y,s,'EdgeColor','None');
colormap hot;
view(90,90);
ylim([empieza empieza+distancia]);
xlim([0 (aux-1)*2.2]);
xlabel('Distancia transversal (\mu m)');
ylabel('Distancia axial (cm)');
title(['Talbot carpet de una red de ' nombre ' \mu m']);
[~,~,~] = mkdir(nombre);
saveas(h,[nombre '\carpet.png']);

h2 = figure;
plot(Y,cont);
xlabel('Distancia axial (cm)');
ylabel('Contraste');
title('Contraste de autoimágenes Talbot');
saveas(h2,[nombre '\carpet.fig']);


[v,dist] = poi(cont);
dist = 2*dist*step/1000
s = size(v);

for n=1:3
    mpiabs_wait_new(ID,1,(v(n)-1)*step);
    imago = Captura(Cam,camara);
    imago = rgb2gray(imago);
    name = [nombre '\' num2str((v(n)-1)*step/1000) 'mm.png'];
    imwrite(imago,name);
end

save([nombre '\cosas.mat'], 'dist', 'Y', 'cont');
CierraCamara(Cam,camara);
end

