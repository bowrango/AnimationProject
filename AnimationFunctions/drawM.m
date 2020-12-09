function elem_handle = draw(element, draw_params)
    % create a handle for the drawn element
    
    % curly braces here are important!
    axes_handle = draw_params{1};
    color = draw_params{2};
    alpha = draw_params{3};
   
    elem_handle = scatter(axes_handle, element(1, :), element(2, :), 4, color, 'square', 'filled'); hold off
    elem_handle.MarkerFaceAlpha = alpha;
%     xlim([0 600]); ylim([0 600])
end

