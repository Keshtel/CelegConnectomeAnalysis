function CharLen = characteristic_length(ConnectivityMatrix, NoInf)
% Returns the characteristic path length L of the network from the
% ConnectivityMatrix. Set NoInf to 1 to exclude infinities and set to 0
% otherwise.
N = length(ConnectivityMatrix); 
DG = digraph(ConnectivityMatrix);
dmat = distances(DG);
if NoInf == 1
    dmat(isinf(dmat))=0;
end
CharLen = 1./N/(N-1)*sum(dmat,'all');