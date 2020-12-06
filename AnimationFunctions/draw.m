function handle = draw(element)
    % Plot the coordinates within the 3xN element vector
    
    handle = scatter(element(1, :), element(2, :), 4, 'k', 'square', 'filled'); hold on
    xlim([0 600]); ylim([0 600])
end

