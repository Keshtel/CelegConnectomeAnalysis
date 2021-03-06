function struct = ClusteringCoeff(ConnMatTot,directed)
N = length(ConnMatTot); 
DG = digraph(ConnMatTot);
bins = conncomp(DG,'OutputForm','cell');%returns a cell vector. bins{i} are the id of the nodes of the connected component i of the graph
for i=1: length(bins)
    subN = length(bins{i}); %#of members of the new subgraph
    if subN>1 %discard components of size 1        
        ConnMat = getSubNetConn(ConnMatTot,bins{i});
        struct.(sprintf('subgraph%d',i)) = subClusteringCoeff(ConnMat,directed);
        struct.(sprintf('subgraph%d',i)).OrigID = bins{i};
    end
end
end
        
function ClusCoeff = subClusteringCoeff(ConnMat,directed)
%CLUSTERINGCOEFF computes clustering coefficient of each node and the whole
%graph. choose directe= 0:undirected graph, 1:directed graph
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

