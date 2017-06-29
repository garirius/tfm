function cosastalbot(ID,Cam,camara,distancia)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% distancia en micras
numeropasos = 1000;
empieza = 0;
step = distancia/numeropasos;
pos = empieza;
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
    
    for j=1:size(tempo)
        s(i,j) = tempo(j);
    end
    pos = pos + step;
    mpiabs_wait_new(ID,1,pos);
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
ylabel('Distancia axial (\mu m)');

CierraCamara(Cam,camara);
save('testmot.mat','s','X','Y');

end

