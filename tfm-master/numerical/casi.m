function pos = casi(v,val)
    %Encuentra un valor val en un vector ordenado v
    x = val;
    pos = 1;

    while val>v(pos)
        pos = pos + 1;
    end
end