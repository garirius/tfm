function res = oposto(ang)
% Busca el �ngulo entre 0 y 2pi opuesto a ang

    res = ang + pi;
        
    while res > 2*pi
        res = res - 2*pi;
    end
end