function h_element = materializeM(element, draw_params, time, steps)

    % time is overall time to appear
    % rate is steps per second 
    axes_handle = draw_params{1};
    color = draw_params{2};
    max_alpha = draw_params{3};

    h_element = scatter(axes_handle, element(1, :), element(2, :), 4, color, 'square', 'filled'); hold off
    h_element.MarkerFaceAlpha = 0;
    h_element.MarkerEdgeAlpha = 0;
    
    delay = time/steps;
    step = max_alpha/steps;
    % iterate alpha value
    for a = step:step:max_alpha
        h_element.MarkerFaceAlpha = a;
        h_element.MarkerEdgeAlpha = a;
        pause(delay)
    end
    
end
