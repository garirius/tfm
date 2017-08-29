function ootp(x)
dt = x*[-1 0 1];
N = max(size(dt));
lego = cell(N,1);
lego(1) = {strcat('z_T -',num2str(x/1000),' mm')};
lego(2) = {'z_T'};
lego(3) = {strcat('z_T +',num2str(x/1000),' mm')};
dz = zeros(3,51);
eli = zeros(3,51);
eps = zeros(3,51);
for n=1:N
        [dz(n,:),eli(n,:),eps(n,:)]=lissaexp3(50,dt(n));
end
hold on
grid on
xlabel('Desenfoque (\mu m)');
ylabel('Elipticidad');
plot(dz(1,:),eli(1,:),'--','LineWidth',1.5);
plot(dz(2,:),eli(2,:),'-','LineWidth',1.5);
plot(dz(3,:),eli(3,:),'k:','LineWidth',1.5);
legend(lego);
saveas(gcf,'ootalbotel.png');
close(gcf);

hold on
grid on
xlabel('Desenfoque (\mu m)');
ylabel('e_\pm^2');
plot(dz(1,:),eps(1,:),'--','LineWidth',1.5);
plot(dz(2,:),eps(2,:),'-','LineWidth',1.5);
plot(dz(3,:),eps(3,:),'k:','LineWidth',1.5);
legend(lego);
saveas(gcf,'ootalbotep.png');
close(gcf);

lego = cell(N-1,1);
lego(1) = {strcat('z_T -',num2str(x/1000),' mm')};
lego(2) = {strcat('z_T +',num2str(x/1000),' mm')};
dz1 = zeros(size(dz(2,:)));
dz2 = zeros(size(dz(2,:)));
for n=1:51
    m1 = casi(eps(2,:),eps(1,n));
    m2 = casi(eps(2,:),eps(3,n));
    
    out = ['Para n=' num2str(n) ' tengo m1=' num2str(m1) ' y m2=' num2str(m2)]
end
hold on
grid on
xlabel('\Delta z (\mu m)');
ylabel('Error de cálculo (\mu m)');
plot(dz(2,:),dz1,'LineWidth',1.5);
plot(dz(2,:),dz2,'LineWidth',1.5);
saveas(gcf,'ootalboteper.png');
legend(lego);
end

