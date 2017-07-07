function comparateoexp(name)

zlim = 4000; %a partir de este valor no buscaremos la posición de Talbot
zbor = 500; %a partir de este valor de dz no representamos

%Sacamos los datos de la gráfica que ya teníamos
open([name '.fig']);
h = gcf;
lineObjs = findobj(h,'type','line');
z = get(lineObjs,'XData');
datos = get(lineObjs,'YData');
close(h);

z = cell2mat(z(1));
elip = cell2mat(datos(2));
eps = cell2mat(datos(1));
pos = casi(z,zlim);
z = z(1:pos);
elip = elip(1:pos);
eps = eps(1:pos);

%Buscamos ahora el punto de desenfoque nulo, el mínimo de la elipticidad
[~,pos] = min(elip);
pos = pos(1);
zref = z(pos);
s = size(z);
z2 = zeros(s);
for n=1:s(2)
    z2(n) = z(n)-zref;
end

%Y recortamos para que la cosa sea simétrica
pos1 = casi(z2,-zbor);
pos2 = casi(z2,zbor);

z = z2(pos1:pos2);
elip = elip(pos1:pos2);
eps = eps(pos1:pos2);

%Ahora que tenemos la gráfica offsetada, llega el momento de hacer la
%simulación
[dz,elit,epst]=lissajuste(zbor);

%Y de pintarlo todo
hold on
plot(dz,elit);
plot(z,elip,'.');
legend('Predicción numérica','Valores experimentales');
xlabel('Desenfoque \Delta z (\mu m)');
ylabel('Elipticidad');
saveas(gcf,'elipticidad.png');
close(gcf)
hold on
plot(dz,epst);
plot(z,eps,'.');
legend('Predicción numérica','Valores experimentales');
xlabel('Desenfoque \Delta z (\mu m)');
ylabel('Eliptancia');
saveas(gcf,'eliptancia.png');
close(gcf);
end

