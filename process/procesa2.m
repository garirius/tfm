function procesa2(ID,Cam,camara,distancia)
% distancia en micras
numeropasos = 1000;
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
mask = maskgen(aux,periodo,8,2);

qua = zeros(numeropasos);
eli = zeros(numeropasos);
eps = zeros(numeropasos);
z = zeros(numeropasos);

%vamos tomando medidas
barra = waitbar(0/numeropasos,'Alcanzando el Nirvana...');
for i=1:numeropasos
    %primero que nada, tomar captura
    imago = Captura(Cam,camara);
    imago = rgb2gray(imago);
    
    %Sacamos los puntos de Lissajous, la elipticidad y todo
    [A,B] = sacasig(imago,mask,8,2);
    [r1,r2,qua(k)]=elipsajuste(A,B);
    r1 = abs(r1);
    r2 = abs(r2);
    rmin = min([r1 r2]);
    rmax = max([r1 r2]);
    eli(k) = sqrt(1-(rmin/rmax)^2);
    eps(k) = (r1-r2)/(r1+r2);
    
    z(i) = (i-1)*step;
    mpiabs_wait_new(ID,1,pos);
    waitbar(i/numeropasos);
end
close(barra);

hold on
plot(z,eli,'--');
plot(z,eps,'--');
%plot(Y,qua);
xlabel('z (\mu m)');
legend('Elipticidad','Eliptancia');
end