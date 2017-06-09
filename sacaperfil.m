function s = sacaperfil(imagen)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(imagen);
s = zeros(n,1);
for i=1:n
    s(i) = mean(imagen(:,i));
end

end
