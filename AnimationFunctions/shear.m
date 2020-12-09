function element = shear(element, factor, direction)

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

    switch direction
        case 'verticle'
            S = [1 0 0; factor 1 0; 0 0 1];
        case 'horizontal'
            S = [1 factor 0; 0 1 0; 0 0 1];
    end
    
    element = S*element;
    
    element = element + elementShift; 
end

