function plotEigenVec(eigenVec,eigenVal, select4)%, Names)
%PLOTEIGENVECplots activity of four selected eigenvector and the
%corresponding eigne val
fullscreen = get(0,'ScreenSize');
    figure('Position',[0 -50 fullscreen(3) fullscreen(4)], 'NumberTitle','off', 'Name', 'eigenVec');
    for i = 1:4
        subplot(2,2,i);
        set(gca,'FontSize',16);
        hold on;
        plot(eigenVec(:,i));%plot activity of the first set of cells
        title(sprintf('eigenvector %d with eigenvalue %d',select4(i),eigenVal(select4(i),select4(i))))
    end    
end

