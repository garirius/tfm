function [x,y] = elipson(s)

numsteps = 1000;
x1 = linspace(-1,1,numsteps);
x2 = linspace(1,-1,numsteps);
x = [x1 x2];
y1 = zeros(size(x1));
y2 = zeros(size(x2));

for n=1:numsteps
    a = x1(n);
    y1(n) = sqrt(1-a.^2)/sqrt(1-s.^2*a.^2);
    a = x2(n);
    y2(n) = -sqrt(1-a.^2)/sqrt(1-s.^2*a.^2);
end

y = [y1 y2];

points = [x;y];
mat = [1 -1; 1 1]/sqrt(2);
for n=1:2*numsteps
    aux = points(:,n);
    aux = mat*aux;
    points(1,n)=aux(1);
    points(2,n)=aux(2);
end

x = points(1,:);
y = points(2,:);
end

