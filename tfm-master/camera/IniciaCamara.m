function res = IniciaCamara(Cam,model)

% INICIACAMARA Inicializa una camara Imaging Source usando AxtiveX basado
% en la función INITCAMERA de IOT para fines docentes
%
% res = INITCAMERA(Cam, model) da 0 o 1 si puede abrir correctamente la cámara
% los argumentos de entrada son un objeto Active X "Cam" que controla una cámara 
% Imaging Source y un modelo "model" especificado.
%
% Modelos soportados: 'DFx 31BF03' , 'DMK 21F04', 'DFx 21AF04'
%
% Mirar también LISTADISPOSITIVOS, CAPTURA, LIVEVIDEO, LIVESTOP

%pillamos la lista de dispositivos disponibles
DeviceList=Cam.Devices;
%numero de dispositivos
NDevices=DeviceList.Count;

DeviceNames=cell(1, NDevices);
for n=1:NDevices
    Dev = DeviceList.Item(n);
    DeviceNames{n}=Dev.Name;
end

test=false;
for n=1:NDevices
    test = test || strcmp(model,  DeviceNames{n});
end

if test==false
    disp('La lista de dispositivos disponibles es: ');
    DeviceNames
    %error('Modelo no soportado: no hay ningun dispositivo con ese nombre')
    res = 0;
else
    Cam.Device=model;
    res = 1;
end

% parametros por defecto.
switch model
    case 'DFx 31BF03'
        %poner resolucion por defecto
        %Cam.VideoFormat='UYVY (640x480)';
        Cam.VideoFormat='UYVY (1024x768)';
        %Cam.ContrastAuto=false;
        Cam.WhiteBalanceAuto=true;
        Cam.ExposureAuto=false;
        Cam.Exposure=5;
        %Cam.MemoryCurrentGrabberColorformat='ICY8';
    case 'DMK 21F041'
        Cam.BrightnessAuto=false;
        Cam.ExposureAuto=false;
    case 'DFx 21AF04'
        %poner resolucion por defecto
        Cam.VideoFormat='UYVY (640x480)';
        Cam.WhiteBalanceAuto=true;
        Cam.ExposureAuto=false;
        Cam.Exposure=100;
        Cam.GainAuto = false;
    case 'DMx 72BUC02'
        %Cam.VideoFormat='RGB24 (2560x1920)';
        Cam.VideoFormat='RGB24 (640x480)';
        %originalmente esto estaba en falso
        Cam.ExposureAuto=true;
        %Cam.Exposure=1/10000;
        Cam.GainAuto = false;
        Cam.Gain = 16;
    otherwise
        error('Modelo no soportado')
end

% TODO: Codigo antiguo eliminar cuando proceda
%% para encontar la lista de dispositivos disponibles
% Cam=actxserver('IC.ICImagingControl');
% %lista de dispositivos
% DeviceList=Cam.Devices;
% %numero de dispositivos
% NDevices=DeviceList.Count;
% 
% DeviceNames=cell(1, NDevices);
% for n=1:NDevices
%     Dev = DeviceList.Item(n);
%     DeviceNames{n}=Dev.Name;
% end

%% para encontar la lista de formatos de video disponibles
% Cam=actxserver('IC.ICImagingControl');
% %primero hay que inicializar el modelo de camara 
% Cam.Device='DFx 31F03';
% %lista de formatos de video
% VideoFormatList=Cam.VideoFormats;
% %numero formatos de video
% NVideoFormats=VideoFormatList.Count;
% 
% VideoFormatNames=cell(1, NVideoFormats);
% for n=1:NVideoFormats
%     VideoFormat = VideoFormatList.Item(n);
%     VideoFormatNames{n}=VideoFormat.Name;
% end

