%rescale automatically to make your transition work
%Char_IN is what you were given
%yHeight is what you want for a new max height proportion

function char_out = RescaleT(Char_IN, yHeight)
    inHeight = max(Char_IN(2,:));
    x = inHeight / yHeight;
    
    scale = [x 0 0; 0 x 0; 0 0 1];
    
    char_out = scale * Char_IN;
end
    