function testimp(r1,r2,s)
%TESTIMP Summary of this function goes here
%   Detailed explanation goes here
a = (s/(2*r1*r2)).^2;
b = -(r1.^(-2)+r2.^(-2))/2;
c = r1.^(-2)-r2.^(-2);

term1 = [num2str(a) '*(x.^2-y.^2).^2'];
term2 = [num2str(b) '*(x.^2+y.^2)'];
term3 = [num2str(c) '*x*y'];
ezplot([term1 '+' term2 '+' term3 '+1=0']);

g = max(r1,r2) + 0.5;
xlim([-g g]);
ylim([-g g]);

end

