%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: /Users/adrien/Documents/biophys-project/Analysis/Synapse2020.xlsx
%    Worksheet: herm gap jn synapse adjacency
%
% Auto-generated by MATLAB on 09-Jan-2021 18:12:46

%% Setup the Import Options
opts = spreadsheetImportOptions("NumVariables", 452);

% Specify sheet and range
opts.Sheet = "herm gap jn synapse adjacency";
opts.DataRange = "D4:QM455";

% Specify column names and types
opts.VariableNames = ["I1L", "I1R", "I2L", "I2R", "I3", "I4", "I5", "I6", "M1", "M2L", "M2R", "M3L", "M3R", "M4", "M5", "MCL", "MCR", "MI", "NSML", "NSMR", "pm1", "pm2D", "pm2VL", "pm2VR", "pm3D", "pm3VL", "pm3VR", "pm4D", "pm4VL", "pm4VR", "pm5D", "pm5VL", "pm5VR", "pm6D", "pm6VL", "pm6VR", "pm7D", "pm7VL", "pm7VR", "pm9", "mc1DL", "mc1DR", "mc1V", "mc2DL", "mc2DR", "mc2V", "mc3DL", "mc3DR", "mc3V", "e2D", "e2VL", "e2VR", "e3D", "e3VL", "e3VR", "g1AL", "g1AR", "ASIL", "ASIR", "ASJL", "ASJR", "AWAL", "AWAR", "ASGL", "ASGR", "AWBL", "AWBR", "ASEL", "ASER", "ADFL", "ADFR", "AFDL", "AFDR", "AWCL", "AWCR", "ASKL", "ASKR", "ASHL", "ASHR", "ADLL", "ADLR", "BAGL", "BAGR", "URXL", "URXR", "ALNL", "ALNR", "PLNL", "PLNR", "SDQL", "SDQR", "AQR", "PQR", "ALML", "ALMR", "AVM", "PVM", "PLML", "PLMR", "FLPL", "FLPR", "DVA", "PVDL", "PVDR", "ADEL", "ADER", "PDEL", "PDER", "PHAL", "PHAR", "PHBL", "PHBR", "PHCL", "PHCR", "IL2DL", "IL2DR", "IL2L", "IL2R", "IL2VL", "IL2VR", "CEPDL", "CEPDR", "CEPVL", "CEPVR", "URYDL", "URYDR", "URYVL", "URYVR", "OLLL", "OLLR", "OLQDL", "OLQDR", "OLQVL", "OLQVR", "IL1DL", "IL1DR", "IL1L", "IL1R", "IL1VL", "IL1VR", "AINL", "AINR", "AIML", "AIMR", "RIH", "URBL", "URBR", "RIR", "AIYL", "AIYR", "AIAL", "AIAR", "AUAL", "AUAR", "AIZL", "AIZR", "RIS", "ALA", "PVQL", "PVQR", "ADAL", "ADAR", "RIFL", "RIFR", "BDUL", "BDUR", "PVR", "AVFL", "AVFR", "AVHL", "AVHR", "PVPL", "PVPR", "LUAL", "LUAR", "PVNL", "PVNR", "AVG", "DVB", "RIBL", "RIBR", "RIGL", "RIGR", "RMGL", "RMGR", "AIBL", "AIBR", "RICL", "RICR", "SAADL", "SAADR", "SAAVL", "SAAVR", "AVKL", "AVKR", "DVC", "AVJL", "AVJR", "PVT", "AVDL", "AVDR", "AVL", "PVWL", "PVWR", "RIAL", "RIAR", "RIML", "RIMR", "AVEL", "AVER", "RMFL", "RMFR", "RID", "AVBL", "AVBR", "AVAL", "AVAR", "PVCL", "PVCR", "RIPL", "RIPR", "URADL", "URADR", "URAVL", "URAVR", "RMEL", "RMER", "RMED", "RMEV", "RMDDL", "RMDDR", "RMDL", "RMDR", "RMDVL", "RMDVR", "RIVL", "RIVR", "RMHL", "RMHR", "SABD", "SABVL", "SABVR", "SMDDL", "SMDDR", "SMDVL", "SMDVR", "SMBDL", "SMBDR", "SMBVL", "SMBVR", "SIBDL", "SIBDR", "SIBVL", "SIBVR", "SIADL", "SIADR", "SIAVL", "SIAVR", "DA01", "DA02", "DA03", "DA04", "DA05", "DA06", "DA07", "DA08", "DA09", "PDA", "DB01", "DB02", "DB03", "DB04", "DB05", "DB06", "DB07", "AS01", "AS02", "AS03", "AS04", "AS05", "AS06", "AS07", "AS08", "AS09", "AS10", "AS11", "PDB", "DD01", "DD02", "DD03", "DD04", "DD05", "DD06", "VA01", "VA02", "VA03", "VA04", "VA05", "VA06", "VA07", "VA08", "VA09", "VA10", "VA11", "VA12", "VB01", "VB02", "VB03", "VB04", "VB05", "VB06", "VB07", "VB08", "VB09", "VB10", "VB11", "VD01", "VD02", "VD03", "VD04", "VD05", "VD06", "VD07", "VD08", "VD09", "VD10", "VD11", "VD12", "VD13", "dBWML1", "dBWML2", "dBWML3", "dBWML4", "dBWML5", "dBWML6", "dBWML7", "dBWMR1", "dBWMR2", "dBWMR3", "dBWMR4", "dBWMR5", "dBWMR6", "dBWMR7", "vBWML1", "vBWML2", "vBWML3", "vBWML4", "vBWML5", "vBWML6", "vBWML7", "vBWMR1", "vBWMR2", "vBWMR3", "vBWMR4", "vBWMR5", "vBWMR6", "vBWMR7", "dBWML8", "dBWML9", "dBWML10", "dBWML11", "dBWML12", "dBWML13", "dBWML14", "dBWML15", "dBWML16", "dBWML17", "dBWML18", "dBWML19", "dBWML20", "dBWML21", "dBWML22", "dBWML23", "dBWML24", "dBWMR8", "dBWMR9", "dBWMR10", "dBWMR11", "dBWMR12", "dBWMR13", "dBWMR14", "dBWMR15", "dBWMR16", "dBWMR17", "dBWMR18", "dBWMR19", "dBWMR20", "dBWMR21", "dBWMR22", "dBWMR23", "dBWMR24", "vBWML8", "vBWML9", "vBWML10", "vBWML11", "vBWML12", "vBWML13", "vBWML14", "vBWML15", "vBWML16", "vBWML17", "vBWML18", "vBWML19", "vBWML20", "vBWML21", "vBWML22", "vBWML23", "vBWMR8", "vBWMR9", "vBWMR10", "vBWMR11", "vBWMR12", "vBWMR13", "vBWMR14", "vBWMR15", "vBWMR16", "vBWMR17", "vBWMR18", "vBWMR19", "vBWMR20", "vBWMR21", "vBWMR22", "vBWMR23", "vBWMR24", "CEPshDL", "CEPshDR", "CEPshVL", "CEPshVR", "GLRDL", "GLRDR", "GLRL", "GLRR", "GLRVL", "GLRVR", "CANL", "CANR", "exc_gl", "exc_cell", "hmc", "hyp", "mu_intL", "mu_intR", "mu_anal", "mu_sph", "HSNL", "HSNR", "VC01", "VC02", "VC03", "VC04", "VC05", "VC06"];
opts.SelectedVariableNames = ["I1L", "I1R", "I2L", "I2R", "I3", "I4", "I5", "I6", "M1", "M2L", "M2R", "M3L", "M3R", "M4", "M5", "MCL", "MCR", "MI", "NSML", "NSMR", "pm1", "pm2D", "pm2VL", "pm2VR", "pm3D", "pm3VL", "pm3VR", "pm4D", "pm4VL", "pm4VR", "pm5D", "pm5VL", "pm5VR", "pm6D", "pm6VL", "pm6VR", "pm7D", "pm7VL", "pm7VR", "pm9", "mc1DL", "mc1DR", "mc1V", "mc2DL", "mc2DR", "mc2V", "mc3DL", "mc3DR", "mc3V", "e2D", "e2VL", "e2VR", "e3D", "e3VL", "e3VR", "g1AL", "g1AR", "ASIL", "ASIR", "ASJL", "ASJR", "AWAL", "AWAR", "ASGL", "ASGR", "AWBL", "AWBR", "ASEL", "ASER", "ADFL", "ADFR", "AFDL", "AFDR", "AWCL", "AWCR", "ASKL", "ASKR", "ASHL", "ASHR", "ADLL", "ADLR", "BAGL", "BAGR", "URXL", "URXR", "ALNL", "ALNR", "PLNL", "PLNR", "SDQL", "SDQR", "AQR", "PQR", "ALML", "ALMR", "AVM", "PVM", "PLML", "PLMR", "FLPL", "FLPR", "DVA", "PVDL", "PVDR", "ADEL", "ADER", "PDEL", "PDER", "PHAL", "PHAR", "PHBL", "PHBR", "PHCL", "PHCR", "IL2DL", "IL2DR", "IL2L", "IL2R", "IL2VL", "IL2VR", "CEPDL", "CEPDR", "CEPVL", "CEPVR", "URYDL", "URYDR", "URYVL", "URYVR", "OLLL", "OLLR", "OLQDL", "OLQDR", "OLQVL", "OLQVR", "IL1DL", "IL1DR", "IL1L", "IL1R", "IL1VL", "IL1VR", "AINL", "AINR", "AIML", "AIMR", "RIH", "URBL", "URBR", "RIR", "AIYL", "AIYR", "AIAL", "AIAR", "AUAL", "AUAR", "AIZL", "AIZR", "RIS", "ALA", "PVQL", "PVQR", "ADAL", "ADAR", "RIFL", "RIFR", "BDUL", "BDUR", "PVR", "AVFL", "AVFR", "AVHL", "AVHR", "PVPL", "PVPR", "LUAL", "LUAR", "PVNL", "PVNR", "AVG", "DVB", "RIBL", "RIBR", "RIGL", "RIGR", "RMGL", "RMGR", "AIBL", "AIBR", "RICL", "RICR", "SAADL", "SAADR", "SAAVL", "SAAVR", "AVKL", "AVKR", "DVC", "AVJL", "AVJR", "PVT", "AVDL", "AVDR", "AVL", "PVWL", "PVWR", "RIAL", "RIAR", "RIML", "RIMR", "AVEL", "AVER", "RMFL", "RMFR", "RID", "AVBL", "AVBR", "AVAL", "AVAR", "PVCL", "PVCR", "RIPL", "RIPR", "URADL", "URADR", "URAVL", "URAVR", "RMEL", "RMER", "RMED", "RMEV", "RMDDL", "RMDDR", "RMDL", "RMDR", "RMDVL", "RMDVR", "RIVL", "RIVR", "RMHL", "RMHR", "SABD", "SABVL", "SABVR", "SMDDL", "SMDDR", "SMDVL", "SMDVR", "SMBDL", "SMBDR", "SMBVL", "SMBVR", "SIBDL", "SIBDR", "SIBVL", "SIBVR", "SIADL", "SIADR", "SIAVL", "SIAVR", "DA01", "DA02", "DA03", "DA04", "DA05", "DA06", "DA07", "DA08", "DA09", "PDA", "DB01", "DB02", "DB03", "DB04", "DB05", "DB06", "DB07", "AS01", "AS02", "AS03", "AS04", "AS05", "AS06", "AS07", "AS08", "AS09", "AS10", "AS11", "PDB", "DD01", "DD02", "DD03", "DD04", "DD05", "DD06", "VA01", "VA02", "VA03", "VA04", "VA05", "VA06", "VA07", "VA08", "VA09", "VA10", "VA11", "VA12", "VB01", "VB02", "VB03", "VB04", "VB05", "VB06", "VB07", "VB08", "VB09", "VB10", "VB11", "VD01", "VD02", "VD03", "VD04", "VD05", "VD06", "VD07", "VD08", "VD09", "VD10", "VD11", "VD12", "VD13", "dBWML1", "dBWML2", "dBWML3", "dBWML4", "dBWML5", "dBWML6", "dBWML7", "dBWMR1", "dBWMR2", "dBWMR3", "dBWMR4", "dBWMR5", "dBWMR6", "dBWMR7", "vBWML1", "vBWML2", "vBWML3", "vBWML4", "vBWML5", "vBWML6", "vBWML7", "vBWMR1", "vBWMR2", "vBWMR3", "vBWMR4", "vBWMR5", "vBWMR6", "vBWMR7", "dBWML8", "dBWML9", "dBWML10", "dBWML11", "dBWML12", "dBWML13", "dBWML14", "dBWML15", "dBWML16", "dBWML17", "dBWML18", "dBWML19", "dBWML20", "dBWML21", "dBWML22", "dBWML23", "dBWML24", "dBWMR8", "dBWMR9", "dBWMR10", "dBWMR11", "dBWMR12", "dBWMR13", "dBWMR14", "dBWMR15", "dBWMR16", "dBWMR17", "dBWMR18", "dBWMR19", "dBWMR20", "dBWMR21", "dBWMR22", "dBWMR23", "dBWMR24", "vBWML8", "vBWML9", "vBWML10", "vBWML11", "vBWML12", "vBWML13", "vBWML14", "vBWML15", "vBWML16", "vBWML17", "vBWML18", "vBWML19", "vBWML20", "vBWML21", "vBWML22", "vBWML23", "vBWMR8", "vBWMR9", "vBWMR10", "vBWMR11", "vBWMR12", "vBWMR13", "vBWMR14", "vBWMR15", "vBWMR16", "vBWMR17", "vBWMR18", "vBWMR19", "vBWMR20", "vBWMR21", "vBWMR22", "vBWMR23", "vBWMR24", "CEPshDL", "CEPshDR", "CEPshVL", "CEPshVR", "GLRDL", "GLRDR", "GLRL", "GLRR", "GLRVL", "GLRVR", "CANL", "CANR", "exc_gl", "exc_cell", "hmc", "hyp", "mu_intL", "mu_intR", "mu_anal", "mu_sph", "HSNL", "HSNR", "VC01", "VC02", "VC03", "VC04", "VC05", "VC06"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
giantconn = readtable("Data/Synapse2020.xlsx", opts, "UseExcel", false);

%% Convert to output type
giantconn = table2array(giantconn);

%% Clear temporary variables
clear opts

