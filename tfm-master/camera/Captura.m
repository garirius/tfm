function IC = Captura(Cam,model)

% CAPTURA Captura una imagen usando el control activeX de una camara TIS.
% Basado en la función SNAP de IOT para fines docentes
%
% IC = CAPTURA(Cam, model) devuelve una matriz IC con la imagen capturada
% los argumentos de entrada son un objeto "Cam" que controla una cámara 
% Imaging Source y un modelo "model" especificado.
%
% Modelos soportados: 'DFx 31F03' , 'DMK 21F04', 'DMx 21AF04'
%
% Controles soportados: 'COM.IC_ICImagingControl'
%                       'COM.IC_ICImagingControl3_1'
% 
%
% Mirar también LISTADISPOSITIVOS, CAPTURA, LIVEVIDEO, LIVESTOP
                      
% Comprueba que la camara está inicializada

if ~isequal(class(Cam),'COM.IC_ICImagingControl')
    %disp('No inicializada cámara en el control COM.IC_ICImagingControl');
elseif ~isequal(class(Cam),'COM.IC_ICImagingControl3_1')
    %disp('No inicializada cámara en el control COM.IC_ICImagingControl');
else
    error('Camara no inicializada');
end

% Captura la imagen

Cam.MemorySnapImage;
I=Cam.MemoryGetImageData();

% Convierte la imagen a una imagen RGB 
% TODO: Mirar "Accesing an Image Buffer" para la conversion de espacios de
% color en la ayuda "IC Imaging Control ActiveX user's guide"

% TODO Mirar los filtros Bayer de conversion de espacios de color
% en la ayuda "IC Imaging Control ActiveX user's guide"
% buscar "Technical Articles" ---> "Debayering"  

switch Cam.memoryCurrentGrabberColorformat
    case ('ICY8')
        IC=flipud(I');
    case ('ICRGB24')
        R=3:3:Cam.ImageWidth*3;
        G=2:3:Cam.ImageWidth*3;
        B=1:3:Cam.ImageWidth*3;
        I=flipud(I');
        
        IC = cat(3,I(:,R),I(:,G),I(:,B));
      
    otherwise
          error('Formato de color no soportado');
end

image(IC)
        