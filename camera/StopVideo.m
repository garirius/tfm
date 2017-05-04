function StopVideo(Cam)

% STOPVIDEO Funcion para cerrar la ventana de video en tiempo real 
% de una c�mara TIS
%
% STOPVIDEO(Cam) cierra la ventanta activeX donde muestra la se�al de video 
% que devuelve la c�mara especificada en el objeto Cam.
%
% Controles soportados: 'COM.IC_ICImagingControl'
%                       'COM.IC_ICImagingControl3_1'
%
% Modelos soportados: 'DFx 31F03' , 'DMK 21F04', 'DMx 21AF04'
%
% Mirar tambi�n LISTADISPOSITIVOS, INICIACAMARA, CAPTURA, LIVESTOP

% Comprueba que la camara est� inicializada

if ~isequal(class(Cam),'COM.IC_ICImagingControl')
    %disp('No inicializada c�mara en el control COM.IC_ICImagingControl');
elseif ~isequal(class(Cam),'COM.IC_ICImagingControl3_1')
    %disp('No inicializada c�mara en el control COM.IC_ICImagingControl');
else
    error('Camara no inicializada');
end

% Comprueba que la camara est� mostrando video y si no, lanza una
% advertencia

if(Cam.LiveVideoRunning)
Cam.LiveStop();
else
    warning('El modo Live Video no esta activado');
end
