function NeuronInd = getCellInd(NeuronNames,FullConn)
%GETCELLIND : takes a cell of neuron's name and returns their index in the
%complete connectivity matrix. the input looks
%like:{'NSML','NSMR','HSNL','HSNR'} please incluse L/R in the neurons name
NeuronInd = zeros(size(NeuronNames));
length(NeuronInd)
for i = 1:length(NeuronNames)
    NeuronInd(1,i) = find(strcmp(NeuronNames(i),table2array(FullConn.Names)));
end
%sub

end

