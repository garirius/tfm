function [A,B,R2] = linealfit(x,y)
sx = size(x);
sy = size(y);

if sx(2)>1
    x = x.';
end
if sy(2)>1
    y = y.';
end

sx = size(x);
sy = size(y);

if sx~=sy
    out = 'No coinciden los tamaños nene!'
    A = NaN;
    B = NaN;
    R2 = NaN;
else
    
    [fitipaldi,gof,~] = fit(x,y,'poly1');
    R2 = gof.rsquare;
    A = fitipaldi.p1;
    B = fitipaldi.p2;
end

end

