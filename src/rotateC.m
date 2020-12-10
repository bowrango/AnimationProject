%Pull, rotate, and put back

function char_matrix_out = Rotate2(Character, Degree)
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
    
    %spin the character
    Rotation = [cos(Degree),sin(Degree), 0 ; 
             -sin(Degree), cos(Degree), 0; 
                0 , 0, 1];
    Character = Rotation * Character;
    
    %send the character home
    Character = Character + CharacterShift;
    
    char_matrix_out = Character;
    
    
    
    
    
    
    
    
