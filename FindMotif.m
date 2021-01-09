function struct = FindMotif(Conn,Motif)
%FINDMOTIF finds the subgraphs(motives) of interest in the connectivity
%graph. returns: total number of motives found, member s of each found
%motif, and a vector showing how many motives each neuron is a member of
ConnTot = ~(Conn == 0);
struct.ConnTot=ConnTot;
LConn = length(ConnTot(1,:))
Lmot = length(Motif(1,:))
Lmot
Veccheck = zeros(1,Lmot);
combos = nchoosek(1:LConn,Lmot);
NumMot = 0;
NumMotPerNeu = zeros(1,LConn);
for j = 1:length(combos(:,1))
    allNodePerm = perms(combos(j,:));
    for k= 1:length(allNodePerm(:,1))
        Veccheck = allNodePerm(k,:);
        ConnSub = getSubNetConn(ConnTot,Veccheck);
        if isequal(ConnSub,Motif)
            NumMot = NumMot+1;
            struct.MotMem.(sprintf('motif%d',NumMot)) = allNodePerm(k,:);
            NumMotPerNeu(allNodePerm(k,:))=NumMotPerNeu(allNodePerm(k,:))+1;
        end
    end
end    
struct.NumMot = NumMot;
struct.NumMotPerNeu = NumMotPerNeu;
length(combos(:,1))
end

