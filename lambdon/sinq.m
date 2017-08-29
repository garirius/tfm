function res = sinq(x)
    if x==0
        res = 1;
    else
        res = sin(x)./x;
    end
end