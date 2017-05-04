function [Cam, DeviceList, DeviceNames] = ListaDispositivos

% LISTADISPOSITIVOS Funcion que devuelve una lista de dispositivos
% soportados por el objeto activeX correspondiente a las cámaras de
% la empresa Imaging Source.
%
% [Cam, DeviceList, DeviceNames] = LISTADISPOSITIVOS devuelve el objeto 
% activeX (Cam), la lista de dispositivos (DeviceList) y los nombres de los
% dispositivos conectados actualmente al ordenador (DeviceNames)
%
% Mirar también INICIACAMARA, CAPTURA, LIVEVIDEO, LIVESTOP

% TODO: No es necesario que Cam sea global, mantenemos el caracter global y
% lo eliminamos si procede
%
global Cam;

Cam = actxserver('IC.ICImagingControl3.1');% puede ser 3.1

%Pillamos la lista de dispositivos disponibles
DeviceList=Cam.Devices;

%numero de dispositivos
NDevices=DeviceList.Count;

DeviceNames=cell(1, NDevices);
for n=1:NDevices
    Dev = DeviceList.Item(n);
    DeviceNames{n}=Dev.Name;
end
