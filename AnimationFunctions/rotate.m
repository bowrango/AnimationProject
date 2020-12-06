function element = rotate(element, theta, centroid_idx)
    % Rotate an element some angle theta
    
    % NOTE: Smoother rotations using this function in a loop might be
    % expensive as each step rotation will translate the element back and
    % forth between the origin. We can modify this to contain a loop if
    % things slow down too much. 
    
    % We can assume the elements remain in the z = 0 dimension
    
    % Specifiy some pixel of your element to be the center of rotation.   
    centroid = element(centroid_idx);
    shift = [0; 0; 0] - centroid;
   
    % move the element back to the origin
    element = translate(element, shift(1), shift(2));
    
    % apply the rotation
    R = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
    element = R*element;
    
    % move element back to original location in the scene 
    element = translate(element, -shift(1), -shift(2));
   
end

