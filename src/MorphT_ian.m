%Morph your dude
% This is Ian's slight alteration of Tim's code for his own scene

%BE SURE TO RUN SIZEMATCH.m FIRST (conforms the sizes)

%% example:
%[Mario,Tflower] = SizeMatch(Mario,Tflower); %sets the same size
%new_Mario = MorphT(Mario,Tflower,hb); %does 6 stage morph

%% Actual Function
function [] = MorphT_ian(starting , final, pause_n)

for k=0:1/15:1 %k fraction determines number of Morph steps (set to 1/6 now)
    
    if k > 0
        delete(h_final);
    end

	C = (1-k)*starting + k*final;
	
    h_final = draw_ian(padding_ian(C));
    
	pause(pause_n);
    
    if k == 1
        delete(h_final)
    end
end

end