%%%Script to analyze activity:
subnetwork1= [1:2:10]; % layer 1, ASI AWC AWA ASE ASH
subnetwork2= [11:2:14]; % layer 2, AIY AIA
subnetwork3= [15:2:26]; % layer 3, RIM RIF RIA RIB RME
subnetwork4= [27:2:32]; % layer 4, AVA AVB PVP

ConnMat = XlsxToMat('Data/Synapse2020.xlsx',0);
ConnMat = getSubNetConn(ConnMat,specificsubnet);
dtinv = 1.*length(ConnMat)^2;
tau = dtinv*ones(1,length(ConnMat(1,:)));
Initial = zeros(1,length(ConnMat(1,:)));%initial activity level of the neurons
Initial(1,subnetwork1)=1.;
g = ones(size(Initial));
g = g';%g is a measure of nonlinearity
odeOptions = odeset('RelTol',1e-5,'AbsTol',1e-8);
[struct.tall,struct.Rall] = calcTimeCourse(@Dynamics, ConnMat, tau, g, odeOptions, Initial);
plotFiringGiantreal(struct, subnetwork1, subnetwork2 ,subnetwork3,subnetwork4,{'ASI AWC AWA ASE ASH','AIY AIA','RIM RIF RIA RIB RME','AVA AVB PVP'},1)


%% 

ConnMat = XlsxToMat('Data/Synapse2020.xlsx',0);
ConnTotTest = getSubNetConn(ConnMat,specificsubnet);
Motif = zeros(3);
Motif(2,1) = 1;
Motif(1,2) = 1;
sMotifStruct = FindMotif(ConnTotTest,Motif);
%% 
[eigenVec, eigenVal] = LinearEig(ConnTotTest)
% %% giant subnetworks
% subnetwork1= [1:57]; % pharynx
% subnetwork2= [58:140]; % sensory
% subnetwork3= [141:221]; % intern
% subnetwork4= [222:329]; % motor