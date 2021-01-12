function struct = getConnComp(ConnMatTot, DiscardIsolated)
%GETCONNCOMP returns connected components of a graph
N = length(ConnMatTot); 
DG = digraph(ConnMatTot);
bins = conncomp(DG,'OutputForm','cell');%returns a cell vector. bins{i} are the id of the nodes of the connected component i of the graph
for i=1: length(bins)
    subN = length(bins{i}); %#of members of the new subgraph
    if  DiscardIsolated==1
        if subN>1 %discard components of size 1        
            ConnMat = getSubNetConn(ConnMatTot,bins{i});
            struct.(sprintf('subgraph%d',i)).OrigID = bins{i}; %id of the vertices of the connected components
            struct.(sprintf('subgraph%d',i)).Graph = subgraph(DG, bins{i});
        end
    else
        ConnMat = getSubNetConn(ConnMatTot,bins{i});
        struct.(sprintf('subgraph%d',i)).OrigID = bins{i};
    end
end
struct.NumCom =length(fieldnames(struct));%total number of components
end


