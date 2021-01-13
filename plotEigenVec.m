function StrongNeu = plotEigenVec(eigenVec,eigenVal, select6, NeurNames)
%PLOTEIGENVECplots activity of six selected eigenvector and the
%corresponding eigne val
fullscreen = get(0,'ScreenSize');
    figure('Position',[0 -50 fullscreen(3) fullscreen(4)], 'NumberTitle','off', 'Name', 'eigenVec');
    for i = 1:6
        subplot(2,3,i);
        set(gca,'FontSize',16);
        hold on;
        plot(eigenVec(:,i));%plot activity of the first set of cells
%         set(gca, 'XTick', 1:length(eigenVec(:,i)), ...                            
%              'XTickLabel', NeurNames);
         xtickangle(90)  
         Eig = eigenVec(:,i);
        locs= find(abs(Eig)>0.03);
        StrongNeu.(sprintf('mode%d',i)).names = NeurNames(locs);
        StrongNeu.(sprintf('mode%d',i)).eigVal = eigenVal(select6(i),select6(i));
        text(locs, Eig(locs), NeurNames(locs));
        title(sprintf('eigenvector %d with eigenvalue %d',select6(i),eigenVal(select6(i),select6(i))))
    end    
end

