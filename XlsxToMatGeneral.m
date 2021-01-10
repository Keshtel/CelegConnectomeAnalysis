function ConnMat = XlsxToMatGeneral(ConnectivityExcelFile, delNum)
%XLSXTOMAT reads the excel sheet of connecticvity matrix and saves it as a
%matlab structure. iput is a path like:'file.slsx'. delNum= 0: eliminating
%body wall muscles, other end organs and sex specific neurons-1: only eliminating
%body wall muscles and other end organs-2: not eliminating anything
%
Matrix = {'hermChem','hermGap', 'maleChem', 'maleGap','maleGapAsy', 'maleGapSym'};%This list changes based on the order of spreadsheets you see
sheets = sheetnames(ConnectivityExcelFile);
SheetNumber = length(sheets);
for i= 1:4% set i=2:4 if first sheet is explanations
    Matrix{i}
    connJuly=readtable(ConnectivityExcelFile,'Sheet',sheets{i});
    ConnMat.(Matrix{i}).Names = connJuly(:,3);
    ConnMat.(Matrix{i}).Names(end,:) = [];
    connJuly(:,[1:3 end])=[];%eliminateing the first three columns because the contain no number
    connJuly(end,:)=[];
    connJuly = table2array(connJuly);
    connJuly(isnan(connJuly))=0;
    connJuly =  connJuly;

     if delNum == 0%removing non-neuron cells and sex-specific neurons
         connJuly(330:end,:)=[];
         connJuly(:,330:end)=[];
         ConnMat.(Matrix{i}).Names(330:end,:) = [];
     end
     ConnMat.(Matrix{i}).Conn = connJuly;
end     
end

