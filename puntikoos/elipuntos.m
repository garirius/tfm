function elipuntos(zl)

%Traure les dades teòriques
[dzt,elit,epst]=lissateo(zl);
[dze,elie,epse]=lissaexp(zl);
dzt = dzt*1000000;
dze = dze*1000000;

hold on
plot(dzt,elit,'--','LineWidth',3);
plot(dze,elie,'LineWidth',1.5);
grid on
xlabel('Desenfoque (\mu m)');
ylabel('Elipticidad');
legend('Teoría','Ajuste');
saveas(gcf,'elicomp.png');
close(gcf)
hold on
plot(dzt,epst,'--','LineWidth',3);
plot(dze,epse,'LineWidth',1.5);
grid on
xlabel('Desenfoque (\mu m)');
ylabel('e^2_\pm');
legend('Teoría','Ajuste');
saveas(gcf,'epscomp.png');
close(gcf)
end

