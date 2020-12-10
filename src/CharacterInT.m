%Pull, rotate, and put back

function char_matrix_out = CharacterInT(Character)
    %MatrixSize = size(Character, 2); %copy the input matrix size

    % x centerpoint using (minimum x + maximum x) / 2
    CenterpointX = (min(Character(1,:)) + max(Character(1,:)))/2;
    
    % y centerpoint using (minimum y + maximum y) / 2
    CenterpointY = (min(Character(2,:)) + max(Character(2,:)))/2;
    
    %create a ones matrix to build x distance to origin
    xFix = ones(1,length(Character(1,:))); 
    xFix = CenterpointX .* xFix;
    
    % creates a ones matrix to build y distance to origin
    yFix = ones(1,length(Character(2,:))); 
    yFix = CenterpointY .* yFix;
    
    %move to orign
    CharacterShift = [xFix; yFix; zeros(1,length(Character(1,:)))];
    Character = Character - CharacterShift;
    
    %% calculate new minimum to bring right of y-axis
    xShift = ones(1,length(Character(1,:)));
    xShit = min(Character(1,:)) * xShift; %matrix to adjust x values
    Character(1,:) = Character(1,:) - xShift; %minus b/c negative number
    
    %% calculate new minimum to bring above x-axis
    yShift = ones(1,length(Character(2,:)));
    yShift = min(Character(2,:)) * yShift;
    Character(2,:) = Character(2,:) - yShift; %minus b/c again negative
    
    
    
    char_matrix_out = Character
    
    
    
    
    
    
    
    
