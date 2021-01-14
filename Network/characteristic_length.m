function struct = characteristic_length(ConnectivityMatrix)
% Returns the characteristic path length L of the network from the
% ConnectivityMatrix. it first partiotions the network to its connected
% components and computes the characteristic length for each of them 
N = length(ConnectivityMatrix); 
DG = digraph(ConnectivityMatrix);
bins = conncomp(DG,'OutputForm','cell');%returns a cell vector. bins{i} are the id of the nodes of the connected component i of the graph
for i=1: length(bins)
    subN = length(bins{i}); %#of members of the new subgraph
    if subN>1 %discard components of size 1
        struct.(sprintf('subgraph%d',i)).OrigID = bins{i};
        bins{i}
        subDG = subgraph(DG, bins{i});
        struct.(sprintf('subgraph%d',i)).Graph = subDG;
        dmat = distances(subDG);
        CharLen = 1./subN/(subN-1)*sum(dmat,'all');
        struct.(sprintf('subgraph%d',i)).CharLen = CharLen;
    end
end
end
%if NoInf == 1
%    dmat(isinf(dmat))=0;
%end
