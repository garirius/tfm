function s = sacaperfil(imagen)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(imagen);
s = zeros(m);
for i=1:m
    s(i) = mean(imagen(i,:));
end

end
