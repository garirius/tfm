function LiveVideo(Cam)

% LIVEVIDEO Funcion para mostrar video en tiempo real de una cámara TIS
%
% LIVEVIDEO(Cam) abre una ventanta activeX donde muestra la señal de video
% que devuelve la cámara especificada en el objeto Cam.
%
% Controles soportados: 'COM.IC_ICImagingControl'
%                       'COM.IC_ICImagingControl3_1'
%
% Modelos soportados: 'DFx 31F03' , 'DMK 21F04', 'DMx 21AF04'
%
% Mirar también LISTADISPOSITIVOS, INICIACAMARA, CAPTURA, LIVESTOP

% Comprueba que la camara está inicializada

if ~isequal(class(Cam),'COM.IC_ICImagingControl')
    %disp('No inicializada cámara en el control COM.IC_ICImagingControl');
elseif ~isequal(class(Cam),'COM.IC_ICImagingControl3_1')
    %disp('No inicializada cámara en el control COM.IC_ICImagingControl');
else
    error('Camara no inicializada');
end

% Comprueba que no hay otra ventana de video abierta y abre la ventana
% para mostrar el video

if(Cam.LiveVideoRunning)
    warning('¡Ya hay una ventana de video abierta!');
else
    Cam.LiveStart();
end
