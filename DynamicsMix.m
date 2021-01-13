function [dV] = DynamicsMix(~, V, connGap, connChem, tau, g)
%dynamics is the differential equation that governs the system
%V is the vector of membrane potential of different cells. tau is the vector 
%of time constants for all neurons and g is the measure of nonlinearity 
%that we first put to 0.

%g = zeros(size(V))';
dV = zeros(size(V));
D = zeros(size(connGap));
for k=1:length(V)
    D(k,k) = sum(connGap(k,:));
end
L=conn-D;
for i=1:length(V)
    dV(i) = (connChem(:,i)'*V + L(:,i)'*V-g'*V)./tau(i);
end    
end

