%%%Script to analyze activity:
subnetwork1= [1:75];
subnetwork2= [75:150];
subnetwork3= [150:225];
subnetwork4= [225:300];

ConnMat = XlsxToMat('Data/Synapse2020.xlsx',0);
ConnMat = getSubNetConn(ConnMat,[1:80]);
tau = 0.05*ones(1,length(ConnMat(1,:)));
Initial = rand(1,length(ConnMat(1,:)));%initial activity level of the neurons
g = rand(size(Initial));
g = g';%g is a measure of nonlinearity
odeOptions = odeset('RelTol',1e-5,'AbsTol',1e-8);
[struct.tall,struct.Rall] = calcTimeCourse(@Dynamics, ConnMat, tau, g, odeOptions, Initial);
plotFiringGiantreal(struct,subnetwork1, subnetwork2 ,subnetwork3,subnetwork4,{'1','2','3','3'},0)


%% 

ConnMat = XlsxToMat('Data/Synapse2020.xlsx',0);
ConnTotTest = getSubNetConn(ConnMat,[1:80]);
Motif = zeros(3);
Motif(2,1) = 1;
Motif(1,2) = 1;
sMotifStruct = FindMotif(ConnTotTest,Motif);
%% 
[eigenVec, eigenVal] = LinearEig(ConnTotTest)