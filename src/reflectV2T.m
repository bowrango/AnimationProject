% Chooose axis to be reflected by 'x' or 'y'/
function char_matrix_out = reflectV2T(Character, axis)
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
    switch axis
        case 'x'
            R = [1 0 0; 0 -1 0; 0 0 1];
        case 'y'
            R = [-1 0 0; 0 1 0; 0 0 1];
    end
    Character = R*Character;
    %send the character home
    Character = Character + CharacterShift;

    char_matrix_out = Character;  
end