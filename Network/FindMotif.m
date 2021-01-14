function struct = FindMotif(Conn,Motif)
%FINDMOTIF finds the subgraphs(motives) of interest in the connectivity
%graph. returns: total number of motives found, member s of each found
%motif, and a vector showing how many motives each neuron is a member of
ConnTot = ~(Conn == 0);%transforming connectivity matrix to a graph adjacency matrix
struct.ConnTot=ConnTot;
LConn = length(ConnTot(1,:));
Lmot = length(Motif(1,:));

Veccheck = zeros(1,Lmot);
combos = nchoosek(1:LConn,Lmot);% number of ways we can choose Lmot nodes from LConn nodes
NumMot = 0;%number of motives found
NumMotPerNeu = zeros(1,LConn);
for j = 1:length(combos(:,1))
    allNodePerm = perms(combos(j,:));%to include direction the motif has to be checked on all the permutation of chosen points
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

