function s = sacaperfil2(imagen)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(imagen);
s = zeros(n);
for i=1:n
    s(i) = mean(imagen(:,i));
end

end
