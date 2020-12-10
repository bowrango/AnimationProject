%Conrtaction (stretch up or down)
function Character_out = contractionT(Character, factor)
    %0<factor<1 for cotraction , factor >1 for expansion
    
    scale = [1 0 0; 0 factor 0; 0 0 1]; %factor it expands or contracts
    
    %move to the y-axis to perform contraction
    ymin = min(Character(2,:));
    yadjust = ones(1,length(Character(2,:)));
    yadjust = ymin * yadjust;
    
    Character(2,:) = Character(2,:) - yadjust;
    
    %perform the contraction
    Character = scale * Character;
    
    %move the character back to original location
    Character(2,:) = Character(2,:) + yadjust;
    
    Character_out = Character;
end
