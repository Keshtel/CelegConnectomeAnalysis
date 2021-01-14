function struct = characteristic_length1(ConnectivityMatrix)
% Returns the characteristic path length L of the network from the
% ConnectivityMatrix. Set NoInf to 1 to exclude infinities and set to 0
% otherwise.
N = length(ConnectivityMatrix); 
DG = digraph(ConnectivityMatrix);
bins = conncomp(DG,'OutputForm','cell');%returns a cell vector. bins{i} are the id of the nodes of the connected component i of the graph 
%length(bins)
bins
if length(bins)>1
    for i=1: length(bins)
        subN = length(bins{i}); %#of members of the new subgraph
        %bins{i}
        if subN>1 %discard components of size 1
            struct.(sprintf('subgraph%d',i)).OrigID = bins{i};
            subDG = subgraph(DG, bins{i});
            struct.(sprintf('subgraph%d',i)).Graph = subDG;
            dmat = distances(subDG);
            CharLen = 1./subN/(subN-1)*sum(dmat,'all');
            struct.(sprintf('subgraph%d',i)).CharLen = CharLen;
        end
    end
else
    dmat = distances(DG);
    CharLen = 1./N/(N-1)*sum(dmat,'all');
    struct = CharLen; 
end

end

