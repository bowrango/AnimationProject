function h_element = flashingM(h_element, flashes, q)
    % flashes element on the scene similarly to the game
    
    
    delay = (q.^((1:flashes)-1))/2; 
    
    for i = 1:length(delay)
    set(h_element, 'Visible', 'off')
    pause(delay(i))
    set(h_element, 'Visible', 'on')
    pause(delay(i))
    end
end