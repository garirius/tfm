function res = CierraCamara(Cam,model)

% CIERRACAMARA Cierra la camara Imaging Source 
%
% res = INITCAMERA(Cam, model) da 0 o 1 si puede cerrar o no correctamente 
% la cámara los argumentos de entrada son un objeto "Cam" que controla 
% la cámara Imaging Source y el modelo "model" especificado.
%
% Modelos soportados: 'DFx 31F03' , 'DMK 21F04', 'DMK 21AF04'
%
% Mirar también INICIACAMARA, LISTADISPOSITIVOS, CAPTURA, LIVEVIDEO, LIVESTOP

%Comprobamos que la cámara está activa

if isempty(Cam.Device)
    disp('No inicializada cámara en el control ActiveX');
    res = 0;
else
    % Cerramos el video (por si estuviera funcionando)
    Cam.LiveStop();
    % Desactivamos el dispositivo
    Cam.Device = '';
    % Codigo de error
    res = 1;
end