function talbotexp(n,beg,fin)
%Toma n fotos entre las posiciones beg (mm) y fin (mm)

%Se inicializa la cámara
[Cam, DeviceList, DeviceNames] = ListaDispositivos;
modelo = DeviceNames{1};
res = IniciaCamara(Cam,modelo);

%Convertimos nuestras medidas a micras;
beg = beg*1000;
fin = fin*1000;
if(res==1)
    %en caso de haber podido inicializar la cámara, inicializamos también los motores
    ID = inicializarmotorespi_new();
    mpiabs_wait_new(ID,1,beg);
    
    step = (fin-beg)/(n-1); %calculamos cuánto es el paso en micras de cada foto
    
    %Finalmente, sólo queda ir tomando fotos
    for i=1:n
        pos = (beg + step*(i-1));
        str = strcat("fotos/captura_",num2str(pos,"%d"),"u");
        imagen = Captura(Cam,modelo);
        imwrite(imagen,str);
        mpirel_wait_new(ID,1,step);
    end
else
    "¡No hay cámara!"
end
    
end