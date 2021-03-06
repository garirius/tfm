function procesa2(ID,Cam,camara,distancia)
% distancia en micras
numeropasos = 500;
empieza = 0;
step = distancia/numeropasos;
pos = empieza;
%Inicializamos nuestras mierdas
IniciaCamara(Cam,camara);
Cam.ExposureAuto = 0;
mpiabs_new(ID,1,empieza);    

periodo = 110;
pxsize = 2.2;
periodo = periodo/pxsize;

%Cogemos una imagen para saber su tamaño y generar la máscara
aux = Captura(Cam,camara);
aux = rgb2gray(aux);
mask = maskgen(aux,periodo,8,2);
eli = zeros(1,numeropasos);
eps = zeros(1,numeropasos);
z = zeros(1,numeropasos);

%vamos tomando medidas
barra = waitbar(0/numeropasos,'Alcanzando el Nirvana...');
for i=1:numeropasos
    %primero que nada, tomar captura
    imago = Captura(Cam,camara);
    imago = rgb2gray(imago);
    imago2 = im2double(imago);
    %Sacamos los puntos de Lissajous, la elipticidad y todo
    [A,B] = sacasig(imago2,mask,8,2);
    [eli(i), eps(i)]=sacapar(A,B);
    
    z(i) = (i-1)*step;
    mpirel_wait_new(ID,1,step);
    waitbar(i/numeropasos);
end
close(barra);
im1 = imshow(imago);
im2 = imshow(imago2.*mask);
h = figure;
hold on
plot(z,eli,'--');
plot(z,eps,'--');
xlabel('z (\mu m)');
legend('Elipticidad','Eliptancia');
CierraCamara(Cam,camara);
end