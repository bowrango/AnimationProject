%Match their sizes
function [CharacterOut1 , CharacterOut2] = SizeMatchM(Character1, Character2)

    char1size = length(Character1(1,:));
    char2size = length(Character2(1,:));
    
    %case 1 first character is bigger
    if char1size > char2size
        diff = char1size - char2size;
        while diff > 0
            if diff > char2size
               diff = char2size;
            end %end of if
            Character2 = [Character2, Character2(:,1:diff)];
            char2size = length(Character2(1,:));
            diff = char1size - char2size;
      
        end %end of while
    end %end of if
        
        
    %case 2 second character is bigger
    if char2size > char1size
        diff = char2size - char1size;
        while diff > 0
            if diff > char1size
                diff = char1size;
            end %end of if
            Character1 = [Character1, Character1(:,1:diff)];
            char1size = length(Character1(1,:));
            diff = char2size - char1size;
      
        end %end of while
    end %end of if
    
    CharacterOut1 = Character1;
    CharacterOut2 = Character2;
end %end of function