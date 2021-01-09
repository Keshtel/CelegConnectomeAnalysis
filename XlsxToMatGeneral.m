function ConnMat = XlsxToMat(ConnectivityExcelFile, delNum)
%XLSXTOMAT reads the excel sheet of connecticvity matrix and saves it as a
%matlab structure. iput is a path like:'file.slsx'. delNum= 0: eliminating
%body wall muscles, other end organs and sex specific neurons-1: only eliminating
%body wall muscles and other end organs-2: not eliminating anything
%
Matrix = {'Blank', 'hermChem','hermGapAsy', 'hermGapSym', 'maleChem','maleGapAsy', 'maleGapSym'};
sheets = sheetnames(ConnectivityExcelFile);
SheetNumber = length(sheets);
for i= 2:4
    Matrix{i}
    connJuly=readtable(ConnectivityExcelFile,'Sheet',sheets{i});
    ConnMat.(Matrix{i}).Names = connJuly(:,3);
    connJuly(:,[1:3 end])=[];%eliminateing the first three columns because the contain no number
    connJuly(end,:)=[];
    connJuly = table2array(connJuly);
    connJuly(isnan(connJuly))=0;
    connJuly =  connJuly';

     if delNum == 0
         connJuly(293:end,:)=[];
         connJuly(:,293:end)=[];
     end
     ConnMat.(Matrix{i}).Conn = connJuly;
end     
end

