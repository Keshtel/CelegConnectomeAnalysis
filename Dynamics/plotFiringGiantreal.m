function plotFiringGiantreal(structureIn,vec1, vec2 ,vec3,vec4,Names, mode)
%This is for plotting all the cells in the giant model.NewConn is the
%variable that contains information about howmany cells of each type we
%have and where in the firing rate matrix they are located. mode = 0:all
%activity in one plot, 1:activity of different cells in different plots

if mode ==0
    fullscreen = get(0,'ScreenSize');
    figure('Position',[0 -50 fullscreen(3) fullscreen(4)], 'NumberTitle','off', 'Name', 'plot activities');
    for i=1:length(structureIn.Rall(1,:))
        set(gca,'FontSize',16);
        hold on;
        plot(structureIn.tall,structureIn.Rall(:,i));%plot activity of the first set of cells
        title(Names{1})
    end 
end    


if mode ==1
    fullscreen = get(0,'ScreenSize');
    figure('Position',[0 -50 fullscreen(3) fullscreen(4)], 'NumberTitle','off', 'Name', 'plot activities');
    for i=1:length(vec1)
        subplot(2,2,1);
        set(gca,'FontSize',16);
        hold on;
        plot(structureIn.tall,structureIn.Rall(:,vec1(i)));%plot activity of the first set of cells
        title(Names{1})
    end


    for i=1:length(vec2)
    subplot(2,2,2);
    set(gca,'FontSize',16);
    hold on;

    plot(structureIn.tall,structureIn.Rall(:,vec2(i)));
    end 
    title(Names{2})

    for i=1:length(vec3)
    subplot(2,2,3);
    set(gca,'FontSize',16);
    hold on;
    plot(structureIn.tall,structureIn.Rall(:,vec3(i)));
    end
    title(Names{3})

    for i=1:length(vec4)
    subplot(2,2,4);
    set(gca,'FontSize',16);
    hold on;
    plot(structureIn.tall,structureIn.Rall(:,vec4(i)));
    title(Names{4})
    end
end
end