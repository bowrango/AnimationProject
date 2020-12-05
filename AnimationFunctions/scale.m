function element = scale(element, y_scale, x_scale)
    % Scale an element 
    
    erase(element)

    S = [x_scale 0 0; 0 y_scale 0; 0 0 1];
    element = S*element;      
 
end
