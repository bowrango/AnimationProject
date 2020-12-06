function element = translate(element, dx, dy)  
    % Move an element in the scene -> update coordinates
    T = [1 0 dx; 0 1 dy; 0 0 1];
    element = T*element;
end

