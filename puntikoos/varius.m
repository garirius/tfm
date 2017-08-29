function varius(where)

N = max(size(where));
figu = zeros(size(where));
leg = cell(N,1);
for n=1:N
    figu(n) = punticur(where(n),n);
    leg(n) = {strcat('\Delta z = ',num2str(where(n)),'\mu m')};
end

legend(figu, leg)
xlabel('S_A (u.a.)');
ylabel('S_B (u.a.)');