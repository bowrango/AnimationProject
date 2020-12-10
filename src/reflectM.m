function element = reflectM(element, axis)
    %MatrixSize = size(Character, 2); %copy the input matrix size

    % x centerpoint using (minimum x + maximum x) / 2
    CenterpointX = (min(element(1,:)) + max(element(1,:)))/2;
    
    % y centerpoint using (minimum y + maximum y) / 2
    CenterpointY = (min(element(2,:)) + max(element(2,:)))/2;
    
    %create a ones matrix to build x distance to origin
    xFix = ones(1,length(element(1,:))); 
    xFix = CenterpointX .* xFix;
    
    % creates a ones matrix to build y distance to origin
    yFix = ones(1,length(element(2,:))); 
    yFix = CenterpointY .* yFix;
    
    %move to orign
    elementShift = [xFix; yFix; zeros(1,length(element(1,:)))];
    element = element - elementShift;
    
    %spin the element
    switch axis
        case 'x'
            R = [1 0 0; 0 -1 0; 0 0 1];
        case 'y'
            R = [-1 0 0; 0 1 0; 0 0 1];
    end
    element = R*element;
    
    %send the element home
    element = element + elementShift; 
end

