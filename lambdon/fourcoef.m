function coef = fourcoef(n)
% n-ésimo coeficiente de Fourier con un periodo p

    mode = 1;
    % 1 -> Red de Ronchi
    % 2 -> Red sinusoidal

    switch mode
    % RED DE RONCHI
    case 1
        if n==0
            coef = 1/2;
        else
            if mod(n,2)==0
                coef = 0;
            else
                coef = 1/(1i*pi*n);
            end
        end
    % RED SINUSOIDAL
    case 2
        switch n
            case 0
                coef = 1/2;
            case -1
                coef = 1i/2;
            case 1
                coef = -1i/2;
            otherwise
                coef = 0;
        end
    end
end