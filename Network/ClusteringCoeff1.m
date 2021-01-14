function ClusCoeff = ClusteringCoeff1(ConnMat,directed)
%CLUSTERINGCOEFF computes clustering coefficient of each node and the whole
%graph. choose directe= 0:undirected graph, 1:directed graph. The input
%graph (corresponding to ConnMat) is better be connected. for not-connected
%graphs use ClusteringCoeff.
L = length(ConnMat(:,1));
Coeff = ones(1,L);
for i = 1: L
    Neighbor = union(find(ConnMat(:,i)),find(ConnMat(i,:)));%id of neighbors of node i
    ClusCoeff.Neighbors.(sprintf('Node%d',i)) = Neighbor;
    subAdjMat=~(getSubNetConn(ConnMat,union(Neighbor,i))==0);
    Lneigh = length(Neighbor);
    if ~(Lneigh==0 || Lneigh==1)
        if directed == 0
            Coeff(1,i) = sum(subAdjMat,'all')/(Lneigh*(Lneigh-1));
        else
            Coeff(1,i) = sum(subAdjMat,'all')/((Lneigh)*(Lneigh-1));
        end   
    end            
end    
ClusCoeff.Coeff= Coeff;
ClusCoeff.MeanCoeff= mean(Coeff);
end

