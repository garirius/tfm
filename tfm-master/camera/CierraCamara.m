function res = CierraCamara(Cam,model)

% CIERRACAMARA Cierra la camara Imaging Source 
%
% res = INITCAMERA(Cam, model) da 0 o 1 si puede cerrar o no correctamente 
% la c�mara los argumentos de entrada son un objeto "Cam" que controla 
% la c�mara Imaging Source y el modelo "model" especificado.
%
% Modelos soportados: 'DFx 31F03' , 'DMK 21F04', 'DMK 21AF04'
%
% Mirar tambi�n INICIACAMARA, LISTADISPOSITIVOS, CAPTURA, LIVEVIDEO, LIVESTOP

%Comprobamos que la c�mara est� activa

if isempty(Cam.Device)
    disp('No inicializada c�mara en el control ActiveX');
    res = 0;
else
    % Cerramos el video (por si estuviera funcionando)
    Cam.LiveStop();
    % Desactivamos el dispositivo
    Cam.Device = '';
    % Codigo de error
    res = 1;
end