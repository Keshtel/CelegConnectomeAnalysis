function ConnMat = XlsxToMat(ConnectivityExcelFile, delNum)
%XLSXTOMAT reads the excel sheet of connecticvity matrix and saves it as a
%matlab structure. iput is a path like:'file.slsx'. delNum= 0: eliminating
%body wall muscles, other end organs and sex specific neurons-1: only eliminating
%body wall muscles and other end organs-2: not eliminating anything
%
sheets = sheetnames(ConnectivityExcelFile)
connJuly=readmatrix(ConnectivityExcelFile);
connJuly(:,[1:3 (end-16):end])=[];%eliminateing the first three columns because the contain no number

connJuly(end,:)=[];
connJuly(isnan(connJuly))=0;

if delNum == 1
    connJuly(330:444,:)=[];
    connJuly(:,330:444)=[];
end

if delNum == 0
    connJuly(330:end,:)=[];
    connJuly(:,330:end)=[];
end    
ConnMat = connJuly;
end

