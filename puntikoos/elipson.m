function [x,y] = elipson(r1,r2,s)

a=1/r1^2;
b=1/r2^2;
c=-s^2*a*b;
numsteps = 1000;
x1 = linspace(-1/sqrt(a),1/sqrt(a),numsteps);
x2 = linspace(1/sqrt(a),-1/sqrt(a),numsteps);
x = [x1 x2];
y1 = zeros(size(x1));
y2 = zeros(size(x2));

for n=1:numsteps
    aux = x1(n);
    y1(n) = sqrt(1-a*aux.^2)/sqrt(b+c*aux.^2);
    aux = x2(n);
    y2(n) = -sqrt(1-a*aux.^2)/sqrt(b+c*aux.^2);
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

