function [dV] = DynamicsChem(~, V, conn, tau, g)
%dynamics is the differential equation that governs the system
%V is the vector of membrane potential of different cells. tau is the vector 
%of time constants for all neurons and g is the measure of nonlinearity 
%that we first put to 0.

%g = zeros(size(V))';
dV = zeros(size(V));

L=conn;
    for i=1:length(V)
        dV(i) = (L(:,i)'*V-g*V)./tau(i);
    end    
end

