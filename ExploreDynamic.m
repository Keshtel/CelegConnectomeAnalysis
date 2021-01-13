%script for checking the t parameter's interval. you could also try
%variating g parameters and see the result here. linear differential
%equation is solved for different values of tau and the result is saved in
%struct.
% These subnetworks are defined to later plot the activity of the neurons in the
% same sheet. Also for setting the initial values of sensory neurons to one
% and the rest zero

%use this if you are working with the whole network:
subnetworkPhar= [1:57]; % pharynx
subnetworkSense= [58:140]; % sensory
subnetworkInt= [141:221]; % intern
subnetworkMot= [222:329]; % motor
 subnetwork1= roamDwellChemind(1,5:14); % layer 1, ASI AWC AWA ASE ASH
 subnetwork2=  roamDwellChemind(1,15:18); % layer 2, AIY AIA
 subnetwork3= roamDwellChemind(1,19:28);% layer 3, RIM RIF RIA RIB RME
 subnetwork4=roamDwellChemind(1,29:34); % layer 4, AVA AVB PVP

% Use this if you are working with a seubnetwork of dwelling-roaming
% behavior
% subnetwork1= [1:2:10]; % layer 1, ASI AWC AWA ASE ASH
% subnetwork2= [11:2:14]; % layer 2, AIY AIA
% subnetwork3= [15:2:26]; % layer 3, RIM RIF RIA RIB RME
% subnetwork4= [27:2:32]; % layer 4, AVA AVB PVP
ConnMat = AllConnMatSexspec.hermChem.Conn;
%% 
parfor t= 1:20
    dtinv=(t/4)^2;
    tau = dtinv*ones(1,length(ConnMat(1,:)));
    Initial = zeros(1,length(ConnMat(1,:)));%initial activity level of the neurons
    Initial(1,subnetworkSense)=1.;%set only initial activity of the ClusteringCoeffsensory neurons to 1
    g = ones(size(Initial));
    %g = ones(size(Initial));
    g = g';%to have the size of g matching in the Dynamic function
    name = sprintf('T%d', t);%result of the siulation is saved under the field name "name"
    odeOptions = odeset('RelTol',1e-5,'AbsTol',1e-8);
    struct = SolveDE(ConnMat, tau, g, odeOptions, Initial);
    fprintf('T%d', t);
    Res = SetResult(struct, name);
    parsave(name, Res);
end
%% 
%this extra section is needed since I parallelized the for loop so the
%models were saved separately and now they should be packed togather
allFiles = dir ('*T*.mat');
for i=1:length(allFiles)
    replace = load(allFiles(i).name, 'result1');  
    k = erase(allFiles(i).name,'.mat');
    AllModels.(k) = replace;
end       

%% 

accepted = fieldnames(AllModels);
for i = 1:length(accepted)
    FinalData.(accepted{i})= AllModels.(accepted{i}).result1.(accepted{i});    
end    
save('ModelsVaryTauSens1g1.mat', '-struct', 'FinalData')

%% plot the tvalue you want by changing fields of FinalData below
plotFiringGiantreal(FinalData.T16, subnetwork1, subnetwork2 ,subnetwork3,subnetwork4,{'ASI AWC AWA ASE ASH','AIY AIA','RIM RIF RIA RIB RME','AVA AVB PVP'},1)


function result = SetResult(withO1, name1)
    result.(name1) = withO1;
end

function parsave(name1, result1)
save(name1, 'result1')
end

