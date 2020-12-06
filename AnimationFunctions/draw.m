function handle = draw(element)
    % create a handle for the drawn element
    
    handle = scatter(element(1, :), element(2, :), 4, 'k', 'square', 'filled'); hold on
    xlim([0 600]); ylim([0 600])
end

