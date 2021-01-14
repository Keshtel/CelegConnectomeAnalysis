function Out = SubnetProperties(ConnMat,directed)
%SUBNETPROPERTIES applies different measure on our subnetwork
Out.CharLen = characteristic_length1(ConnMat);
Out.ClusCoeff = ClusteringCoeff1(ConnMat,1);
[Out.deg, Out.MeanDeg] = degreeNeuron(ConnMat, directed);    
end
function [deg, MeanDeg] = degreeNeuron(ConnMat, directed)

if directed==0
    deg = zeros(1,length(ConnMat));
    for i = 1:length(ConnMat)
        deg(i) = length(union(find(ConnMat(:,i)),find(ConnMat(i,:))));%number of neurons connected to
    end 
    MeanDeg = mean(deg);
else
    deg = zeros(2,length(ConnMat));
    for i = 1:length(ConnMat)
        deg(1,i) = length(find(ConnMat(:,i)));% # of incoming synapses
        deg(2,i) = length(find(ConnMat(i,:)));% # of outgoing synapses
    end
    MeanDeg = mean(deg);
end


end
