function handle = draw_ian(image)
    % create a handle for the drawn element
    % This is Ian's slight alteration of Matt's code for his own scene

    handle = scatter(image(1, :), image(2, :), 4, 'k', 'square', 'filled');  
    hold on
    xlim([0 1280]); ylim([0 720])
    set(gca,'color','none','handlevisibility','on', 'visible','off')
end