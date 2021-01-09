function [eigenVec, eigenVal] = LinearEig(conn)
%this function gives the eigen values and eigen vectors of the linear part
%of differential equation operator

D = zeros(size(conn));
for k=1:length(conn(1,:))
    D(k,k) = sum(conn(k,:));
end
L=conn-D;
[eigenVec, eigenVal] = eig(L);  
end

