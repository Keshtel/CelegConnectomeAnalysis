function ConnMat = specificsubnet(GiantConnMat)
%SPECIFICS
NSM=[22 23] - 3;
HSN=[448 449] - 3;

ASI=[61 62] - 3;
AWA=[65 66] - 3;
ASE=[71 72] - 3;
AWC=[77 78] - 3;
ASH=[81 82] - 3;

AIY=[152 153] - 3;
AIA=[154 155] - 3;

RIF=[166 167] - 3;
RIB=[183 184] - 3;
RIA=[208 209] - 3;
RIM=[210 211] - 3;
RME=[229 230 231 232] - 3;

AVB=[217 218] - 3;
AVA=[219 220] - 3;
PVP=[175 176] - 3;

subnetind = cat(2, NSM, HSN, ASI, AWA, ASE, AWC, ASH, AIY, AIA, RIF, RIB, RIA, RIM, RME, AVB, AVA, PVP);
ConnMat = GiantConnMat(subnetind, subnetind);