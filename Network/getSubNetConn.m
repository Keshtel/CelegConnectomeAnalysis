function SubConn = getSubNetConn(TotConn,subNetCellVec)
%GETSUBNETCONN take the complete connectivity matrix as an input and a
%vector of neurons you are interested in(ex.:[1 3 5 10] ). It returns the connectivity
%matrix of those neurons.
SubNetSize=length(subNetCellVec);
SubConn=zeros(SubNetSize,SubNetSize);
for i =1:SubNetSize
    SubConn0(:,i)= TotConn(:,subNetCellVec(i));
end

for i =1:SubNetSize
    SubConn(i,:)= SubConn0(subNetCellVec(i),:);
end
       
end

