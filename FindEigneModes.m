%% This is to finc the eigenmodes of activity based on gap junction/chemical, or mixed connectivity

load('Data/SynapticHermMaleSexSpec.mat')% load this to get all different connectivities
%% deriving Laplacian operator controlling gap junction networks
Gap = AllConnMatSexspec.hermGap;
ConnGap = Gap.Conn;
g = 0;%parameter of dynamic equation
D = zeros(size(ConnGap));
for k=1:length(D)
    D(k,k) = sum(ConnGap(k,:));
end
Loperator=ConnGap-D;
[eigenVecGap, eigenValGap] = LinearEig(Loperator,g);
eigenValvec=max(abs(eigenValGap));%bring the eigenvalue matrix in vector form
[sortedEigVal,I]=sort(eigenValvec);%sort the eigenvalue to get the 6 smallest ones
F=find(sortedEigVal>0);
%plot the eigen vectors and return strongest neurons contributing
StrongNeuronsGap = plotEigenVec(eigenVecGap,eigenValGap, I(F(1:6)), table2array(Gap.Names));
%% Chemical synapses network
Chem = AllConnMatSexspec.hermChem;
ConnChem = Chem.Conn;
g = 0;%parameter of dynamic equation
[eigenVecChem, eigenValChem] = LinearEig(ConnChem,g);
eigenValvec=max(abs(eigenValChem));%bring the eigenvalue matrix in vector form
[sortedEigVal,I]=sort(eigenValvec);%sort the eigenvalue to get the 6 smallest ones
F=find(sortedEigVal>0);
%plot the eigen vectors and return strongest neurons contributing
StrongNeuronsChem = plotEigenVec(eigenVecChem,eigenValChem, I(F(200:205)), table2array(Chem.Names));

%% the big connected component of the chemical synapses network
Chem = AllConnMatSexspec.hermChem;
ConnChem = Chem.Conn;
ConnChemStruct = getConnComp(ConnChem, 1);
%% Choose the component that has the largest number of members:
ConnChem = getSubNetConn(ConnChem,ConnChemStruct.subgraph32.OrigID);
%the rest follows like normal chemical synapse network section:
g = 0;%parameter of dynamic equation
[eigenVecChem, eigenValChem] = LinearEig(ConnChem,g);
eigenValvec=max(abs(eigenValChem));%bring the eigenvalue matrix in vector form
[sortedEigVal,I]=sort(eigenValvec);%sort the eigenvalue to get the 6 smallest ones
F=find(sortedEigVal>0);
%plot the eigen vectors and return strongest neurons contributing
StrongNeuronsChem = plotEigenVec(eigenVecChem,eigenValChem, I(F(1:6)), table2array(Chem.Names));
%% Sum of the Gap Junction and chemical synapses network
Gap = AllConnMatSexspec.hermGap;
ConnGap = Gap.Conn;
g = 0;%parameter of dynamic equation
D = zeros(size(ConnGap));
for k=1:length(D)
    D(k,k) = sum(ConnGap(k,:));
end
Loperator=ConnGap-D;
Chem = AllConnMatSexspec.hermChem;
ConnChem = Chem.Conn;
ConnTotraw = ConnChem - Loperator;
ConntotStruct = getConnComp(ConnTotraw, 1);
%%
ConnTot = getSubNetConn(ConnTotraw,ConntotStruct.subgraph28.OrigID);
g = 0;%parameter of dynamic equation
[eigenVecTot, eigenValTot] = LinearEig(ConnTot,g);
eigenValvec=max(abs(eigenValTot));%bring the eigenvalue matrix in vector form
[sortedEigVal,I]=sort(eigenValvec);%sort the eigenvalue to get the 6 smallest ones
F=find(sortedEigVal>0);
%plot the eigen vectors and return strongest neurons contributing
StrongNeuronsTot = plotEigenVec(eigenVecTot,eigenValTot, I(F(200:205)), table2array(Chem.Names));
