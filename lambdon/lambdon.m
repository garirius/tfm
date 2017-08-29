function lambdon(down,up,num)
%LAMBDON Summary of this function goes here
%   Detailed explanation goes here
lam = linspace(down,up,num);
leg = cell(size(lam));

for n=1:num
    [dz,eli,eps]=lissajuste(50,lam(n));
    subplot(1,2,1)
    hold on
    plot(dz,eli);
    leg(n) = {strcat('\lambda =',num2str(lam(n)),' nm')};
    
    dz2 = diff(dz);
    eli2 = diff(eli);
    dz2 = dz2.';
    eli2 = eli2./dz2;
    eli2 = eli2.';
    subplot(1,2,2)
    hold on
    plot(dz(1:(max(size(dz))-1)),eli2);
end

legend(leg);

