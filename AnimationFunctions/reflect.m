function element = reflect(element, axis)

    switch axis
        case 'x'
            R = [1 0 0; 0 -1 0; 0 0 1];
        case 'y'
            R = [-1 0 0; 0 1 0; 0 0 1];
    end
    
    element = R*element;
end

